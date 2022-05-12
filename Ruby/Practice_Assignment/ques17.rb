# 17. Write a function which takes an integer (positive) and return an array of Fibonacci number of each index in
# index position till given number.

def fib(num)
  if num == 0
    return 0
  elsif num == 1
    return 1
  else
    return fib(num - 1) + fib(num - 2)
  end
end

def fib_array(array)
  fib_array = []
  array.each {|a| fib_array << fib(a); print a,fib(a)}
  fib_array
end

array = [1,2,3,4,5,6,7,10,11,12,13,14,19,17,23,37,89]
print fib_array(array) , "\n"
