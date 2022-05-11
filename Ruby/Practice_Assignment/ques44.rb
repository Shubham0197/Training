# 44. Create a function that takes the month and year (as integers) and returns the number of days in that month. 
require 'date'

def number_of_days_in_month(year, month)
  date = Date.strptime("01 #{month} #{year}", "%d %m %Y")
  if month < 12
    date_next_month = Date.strptime("01 #{month + 1} #{year}", "%d %m %Y")
  elsif month == 12
    date_next_month = Date.strptime("01 01 #{year + 1}", "%d %m %Y")
  end
  no_of_days = date_next_month - date
  puts no_of_days.to_i
end

print "Enter the following details\n Year:"
year = gets.to_i
print "\n month no."
month = gets.to_i
number_of_days_in_month(year, month)
