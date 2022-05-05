# Create fibonacci series using recursion and gives the no in series at that index

def fib(num)
  if num == 0
    return 0
  elsif num == 1
    return 1
  else
    return fib(num - 1) + fib(num - 2)
  end
end

no_till = gets.to_i
puts fib(no_till)
