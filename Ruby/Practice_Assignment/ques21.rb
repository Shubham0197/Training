# 21. Write a function that takes an integer (less than 1000) and return an array of primes till that number. 
def is_a_prime(num)
  i = 2
  c = 0
  if num == 2
    return 2
  end
  loop do
    if (num % i).zero?
      c = 1
    end
    i += 1
    break if i == (num)
  end

  if c.zero?
    num
  end
end

def prime_array(num)
  prime_arr = []
  (2..num).each { |a| prime_arr << is_a_prime(a);}
  prime_arr.compact
end

print "Enter no below which prime needed to be found : "
no = gets.to_i
print prime_array(no), "\n"
