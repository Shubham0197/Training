# Given a date, return how many days date is away from 2023 (end date not included). date will be in 
# mm/dd/yyyy format.
require 'date'

def away_from_2023(date)
  date_23 = Date.strptime("01/01/2023", '%m/%d/%Y')
  print (date_23 - date).to_i-1, " Days left to 2023\n"
end
print 'Enter the date : '
date = gets
date = Date.strptime(date, '%m/%d/%Y')
away_from_2023(date)
