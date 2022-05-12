# 14. Write a function which takes an integer (positive) and return an array of factorials of each index in index 
# position till given number.

def factorial(no)
  x = 1
  (1..no).each {|i| x *= i }
  print "Factorial of #{no} is #{x} \n"
end

def array_factorial(array)
  array.each {|a| factorial(a)}
end

array = [1,2,3,4,5,6,7,8]
array_factorial(array)