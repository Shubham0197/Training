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


//Stored PROCEDURE to return book just by calling function return_book (book_id, student_id) and put 50rs fine it user is late to return book.

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
  insert into fine(issue_id,student_id,amount) select issue_id,student_id,50 from issue_return_details
  where  book_id=$1 and student_id=$2 and return_date=current_date order by issuer_date desc limit 1;
  end if;
  return passed;
  end;
  $$ language plpgsql;