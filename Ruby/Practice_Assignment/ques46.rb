# 46. Given the parameters day, month and year, return whether that date is a valid date. 
# is_valid_date(35, 2, 2020) ➞ false 
# February doesn't have 35 days.
require 'date'

def is_valid_date(day, month, year)
  begin
    date = Date.strptime("#{day} #{month} #{year}","%d %m %Y")
  rescue Exception => e
    puts e.message
    false
  else
    puts "Correct Date"
  end
end

print "Enter the Date to see if its a valid date\n Day : "
day = gets
print "\n Month : "
month = gets
print "\n Year : "
year = gets

is_valid_date(day, month, year)
