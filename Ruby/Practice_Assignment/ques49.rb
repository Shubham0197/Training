# The 2nd of February 2020 is a palindromic date in both dd/mm/yyyy and mm/dd/yyyy format 
# (02/02/2020). Given a date in dd/mm/yyyy format, return true if the date is palindromic in both date 
# formats, otherwise return false
require 'date'

def is_palindrome(date)
  if date == date.reverse
    return true
  else
    return false
  end
end

def is_date_palindrome(date)
  date = Date.strptime(date, '%d/%m/%Y')
  counter = 0
  date_string = date.strftime("%d%m%Y")
  if !is_palindrome(date_string)
    counter += 1
  end
  date_string = date.strftime("%m%d%Y")

  if !is_palindrome(date_string)
    counter += 1
  end

  if counter >0 
    print "Not a plindrome \n"
  else
    print "It is a plindrome \n"
  end
end


print "Enter the date to find if it is palindrone : "
date = gets
is_date_palindrome(date)
