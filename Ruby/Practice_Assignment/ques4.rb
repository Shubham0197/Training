#4. Given an n-digit large number in form of string, check whether it is divisible by 7 or not. Print 1 if divisible 
# by 7, otherwise 0.
def divisible_by_7(string)
  integer = string.to_i
  if integer % 7 == 0
    print 1
  else
    print 0
  end
end
