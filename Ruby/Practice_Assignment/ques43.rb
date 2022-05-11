=begin
43. Write a function that, given a date (in the format MM/DD/YYYY), returns the day of the week as a string. 
Each day name must be one of the following strings: "Sunday", "Monday", "Tuesday", "Wednesday", 
"Thursday", "Friday", or "Saturday". 
To illustrate, the day of the week for "12/07/2016" is "Wednesday"
=end
require 'date'

def day_of_the_week(date)
  print date.strftime("Day of the week is %A for month %B\n")
end

print 'Enter the date to find the day of the week'
date = gets
date = Date.strptime(date, '%m/%d/%Y')
day_of_the_week(date)
