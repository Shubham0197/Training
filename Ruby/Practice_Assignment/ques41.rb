=begin
Create a function that converts dates from one of five string formats: 
 
    "January 9, 2019" (MM D, YYYY) 
    "Jan 9, 2019" (MM D, YYYY) 
    "01/09/2019" (MM/DD/YYYY) 
    "01-09-2019" (MM-DD-YYYY) 
    "01.09.2019" (MM.DD.YYYY) 
 
The return value will be an array formatted like: [MM, DD, YYYY], where MM, DD, and YYYY are all integers. 
=end
require 'date'

def format_change(date, format)
  case format
  when 1, 2
    date = Date.parse(date)
  when 3
    date  = Date.strptime(date, "%m/%d/%Y")
  when 4
    date  = Date.strptime(date, "%m-%d-%Y")
  when 5
    date  = Date.strptime(date, "%m-%d-%Y")
  end
  puts date.strftime("[%m, %d, %Y]")
end

print "Enter the format of date\n1.(MM D, YYYY)  \n2.(MM D, YYYY)  \n3.(MM/DD/YYYY) \n 4.(MM-DD-YYYY) \n 5.(MM.DD.YYYY) \n Input:"
format = gets.to_i

print "\nEnter the date:"
date_string = gets

format_change(date_string, format)
