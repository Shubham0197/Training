CREATE TABLE "authorization_type" (
  "id" SERIAL PRIMARY KEY,
  "access_type" varchar(100) NOT NULL,
  "description" varchar(100)
);

CREATE TABLE "author" (
  "id" SERIAL PRIMARY KEY,
  "author_name" varchar(100) NOT NULL
);

CREATE TABLE "publisher" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "address" varchar(250)
);

CREATE TABLE "book_type" (
  "id" SERIAL PRIMARY KEY,
  "type" varchar(100) NOT NULL,
  "subtype" varchar(100)
);

CREATE TABLE "department" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(100) NOT NULL,
  "maxamtloan" int
);

CREATE TABLE "book" (
  "id" SERIAL PRIMARY KEY,
  "publisher_id" int,
  "title" varchar(250) NOT NULL,
  "volume" varchar(50) DEFAULT '1',
  "quantity" int,
  "issued_quantity" int,
  "type_id" int
);

CREATE TABLE "student_class_details" (
  "id" SERIAL PRIMARY KEY,
  "department_id" int,
  "name" varchar(250) NOT NULL,
  "year_start" int,
  "year_end" int
);

CREATE TABLE "student" (
  "id" SERIAL PRIMARY KEY,
  "student_class_id" int,
  "name" varchar(250) NOT NULL,
  "mobile" bigint
);

CREATE TABLE "book_author" (
  "book_id" int NOT NULL,
  "author_id" int NOT NULL
);

CREATE TABLE "system_user" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(250) NOT NULL,
  "mobile" bigint,
  "active_status" boolean NOT NULL DEFAULT 'f',
  "authorization_id" int
);

CREATE TABLE "issue_return_details" (
  "id" SERIAL PRIMARY KEY,
  "book_id" int NOT NULL,
  "student_id" int NOT NULL,
  "issuer_date" date NOT NULL DEFAULT (current_date),
  "return_date" date NOT NULL,
  "issuer_user_id" int NOT NULL
);

CREATE TABLE "fine" (
  "id" SERIAL PRIMARY KEY,
  "issue_id" int NOT NULL,
  "student_id" int NOT NULL,
  "amount" int NOT NULL DEFAULT 0,
  "payment_status" boolean DEFAULT 'f'
);

ALTER TABLE "book" ADD FOREIGN KEY ("publisher_id") REFERENCES "publisher" ("id");

ALTER TABLE "book" ADD FOREIGN KEY ("type_id") REFERENCES "book_type" ("id");

ALTER TABLE "student_class_details" ADD FOREIGN KEY ("department_id") REFERENCES "department" ("id");

ALTER TABLE "student" ADD FOREIGN KEY ("student_class_id") REFERENCES "student_class_details" ("id");

ALTER TABLE "book_author" ADD FOREIGN KEY ("book_id") REFERENCES "book" ("id");

ALTER TABLE "book_author" ADD FOREIGN KEY ("author_id") REFERENCES "author" ("id");

ALTER TABLE "system_user" ADD FOREIGN KEY ("authorization_id") REFERENCES "authorization_type" ("id");

ALTER TABLE "issue_return_details" ADD FOREIGN KEY ("book_id") REFERENCES "book" ("id");

ALTER TABLE "issue_return_details" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("id");

ALTER TABLE "issue_return_details" ADD FOREIGN KEY ("issuer_user_id") REFERENCES "system_user" ("id");

ALTER TABLE "fine" ADD FOREIGN KEY ("issue_id") REFERENCES "issue_return_details" ("id");

ALTER TABLE "fine" ADD FOREIGN KEY ("student_id") REFERENCES "student" ("id");


//Stored PROCEDURE to return book just by calling function return_book (book_id, student_id) and put 50rs fine it user is late to return book	.

 create or replace function return_book(int,int)
returns boolean as $$
 declare passed boolean;
 begin
 if not exists( select * from issue_return_details where book_id=$1 and student_id=$2 and return_date is null  )then
 raise exception 'not book issued';
 end if;
  update issue_return_details set return_date=current_date where book_id=$1 and student_id=$2 and return_date is null;
  update book set issued_quantity=(select issued_quantity from book where id=$1)-1 where id=$1;
  if((select current_date-(issuer_date) from issue_return_details where  book_id=$1 and student_id=$2  order by issuer_date desc limit 1)>7) then
  insert into fine(issue_id,student_id,amount) select id,student_id,50 from issue_return_details
  where  book_id=$1 and student_id=$2 and return_date=current_date order by issuer_date desc limit 1;
  end if;
  return passed;
  end;
  $$ language plpgsql;
  
 -- trigger created at the time of issuning book to update the total copies of that book issued and give error if all books have been issued
 --and see it student has not reached his max capacity to issue books
 
 --1st funtion for trigger
create or replace function issued_Amt() returns trigger as $issued_amt$
begin 
if (select quantity from book where id=new.book_id)=(select issued_quantity from book where id=new.book_id) then
raise exception 'all books under this title is issued';
elsif( select count(*) from issue_return_details 
where student_id=new.student_id)= (select maxamtloan from department where 
id = (select department_id from student_class_details where 
id=(select student_class_id from student where id=new.student_id) ))then 
raise exception 'No more books can be issued to USER';
elsif((select quantity from book where id=new.book_id)>(select issued_quantity from book where id=new.book_id))then
update book set issued_quantity=(select issued_quantity from book where id=new.book_id)+1 where id=new.book_id;
end if;
return new;
end;
$issued_amt$ language plpgsql;

--2nd create trigger to trigger above  function before any insert on isssue_return_details table
create trigger issue_amount before insert on issue_return_details
for each row execute function issued_amt();


-- create stored procedure to issue book to student with book_id,student_id,issuer_id
 create or replace function issue_book(int,int,int)
returns boolean as $$
 declare passed boolean;
 begin
insert into issue_return_details(book_id,student_id,issuer_user_id) values($1,$2,$3);
  return passed;
  end;
  $$ language plpgsql;
  
  
  
  
  --Insert Data
insert into author(author_name) values('Premchand');
                                        
insert into author(author_name) values('Amithabh');
                                        
insert into author(author_name) values('Shakespeare');
                                        
insert into author(author_name) values('Anna');



insert into book_type(type) values('classic');

insert into book_type(type) values('novel');

insert into department(name) values ('Computer');

insert into department(name) values ('Mechanical');

insert into department(name) values ('Electrical');

insert into department(name) values ('Biotech');

insert into authorization_type(access_type) values('admin');

insert into authorization_type(access_type) values('issuer');

insert into authorization_type(access_type) values('editor');
insert into publisher(name) values ('Delhi Publisher');

insert into publisher(name) values ('Faridabad Publisher');

insert into publisher(name) values ('Indian Publisher');

insert into book_author values(1,1);
insert into book_author values(2,4);
insert into book_author values(3,1);
insert into book_author values(4,2);
insert into book_author values(6,1);
insert into book_author values(7,1);
insert into book_author values(1,4);
insert into book_author values(8,1);
insert into book_author values(9,2);
insert into book_author values(10,1);
insert into book_author values(11,1);
insert into book_author values(12,3);
insert into book_author values(13,4);
insert into book_author values(13,3);
insert into book_author values(13,2);
insert into book_author values(12,1);
insert into book_author values(13,1);

  
  
  
  
  CONTEXT:  PL/pgSQL function return_book(integer,integer) line 10 at SQL statement
library=# create or replace function return_book(int,int)
library-# returns boolean as $$
library$#  declare passed boolean;
library$#  begin
library$#  if not exists( select * from issue_return_details where book_id=$1 and student_id=$2 and return_date is null  )then
library$#  raise exception 'not book issued';
library$#  end if;
library$#   update issue_return_details set return_date=current_date where book_id=$1 and student_id=$2 and return_date is null;
library$#   update book set issued_quantity=(select issued_quantity from book where id=$1)-1 where id=$1;
library$#   if((select current_date-(issuer_date) from issue_return_details where  book_id=$1 and student_id=$2  order by issuer_date desc limit 1)>7) then
library$#   insert into fine(issue_id,student_id,amount) select id,student_id,50 from issue_return_details
library$#   where  book_id=$1 and student_id=$2 and return_date=current_date order by issuer_date desc limit 1;
library$#   end if;
library$#   return passed;
library$#   end;
library$# select return_book(4,5);
 return_book 
-------------
 
(1 row)

library=# select * from issue_return_details;
 id | book_id | student_id | issuer_date | return_date | issuer_user_id 
----+---------+------------+-------------+-------------+----------------
 12 |       6 |          6 | 2022-04-25  |             |              2
 13 |       8 |          5 | 2022-04-25  |             |              2
 14 |      13 |          5 | 2022-04-25  |             |              2
 15 |      12 |          4 | 2022-04-25  |             |              2
 16 |      10 |          2 | 2022-04-25  |             |              2
  5 |       1 |          1 | 2022-03-23  |             |              1
  6 |       1 |          2 | 2022-03-23  |             |              1
  8 |       2 |          3 | 2022-03-23  |             |              1
  9 |       2 |          1 | 2022-03-23  |             |              1
 11 |       4 |          5 | 2022-03-23  | 2022-04-25  |              1
(10 rows)

library=# select return_book(2,1);
 return_book 
-------------
 
(1 row)

library=# select return_book(2,3);
 return_book 
-------------
 
(1 row)

library=# select return_book(6,6);
 return_book 
-------------
 
(1 row)

library=# select return_book(8,5);
 return_book 
-------------
 
(1 row)

library=# select * from fine;
 id | issue_id | student_id | amount | payment_status 
----+----------+------------+--------+----------------
  1 |       11 |          5 |     50 | f
  2 |        9 |          1 |     50 | f
  3 |        8 |          3 |     50 | f
(3 rows)

library=# select * from issue_return_details;
 id | book_id | student_id | issuer_date | return_date | issuer_user_id 
----+---------+------------+-------------+-------------+----------------
 14 |      13 |          5 | 2022-04-25  |             |              2
 15 |      12 |          4 | 2022-04-25  |             |              2
 16 |      10 |          2 | 2022-04-25  |             |              2
  5 |       1 |          1 | 2022-03-23  |             |              1
  6 |       1 |          2 | 2022-03-23  |             |              1
 11 |       4 |          5 | 2022-03-23  | 2022-04-25  |              1
  9 |       2 |          1 | 2022-03-23  | 2022-04-25  |              1
  8 |       2 |          3 | 2022-03-23  | 2022-04-25  |              1
 12 |       6 |          6 | 2022-04-25  | 2022-04-25  |              2
 13 |       8 |          5 | 2022-04-25  | 2022-04-25  |              2
(10 rows)

library=# select * from book;
 id | publisher_id |        title        | volume | quantity | issued_quantity | type_id 
----+--------------+---------------------+--------+----------+-----------------+---------
  3 |            2 | MartialGod          | 1      |        2 |               0 |       1
  7 |            2 | where is everything | 1      |        2 |               0 |       2
  9 |            2 | DBA                 | 1      |        2 |               0 |       2
 11 |            2 | Let us C            | 1      |        2 |               0 |       2
  1 |            1 | godan               | 1      |        2 |               2 |       1
 13 |            2 | Let us JAVA         | 1      |        2 |               1 |       2
 12 |            2 | Let us C++          | 1      |        2 |               1 |       2
 10 |            2 | DSA                 | 1      |        2 |               1 |       2
  4 |            3 | How to win          | 1      |        2 |               0 |       2
  2 |            2 | sharmdan            | 1      |        2 |               0 |       1
  6 |            2 | You can do          | 1      |        2 |               0 |       2
  8 |            2 | How it works        | 1      |        2 |               0 |       2
(12 rows)

