# 15. Create a function that takes an array of numbers and returns a new array containing only prime numbers.

def is_prime(no)
  x = 0
  (2...no).each {|i| 
    if (no % i).zero?
     x += 1 
    end
    }
  if x == 0
    no
  end
end

def only_prime(array)
  prime = []
  array.each {|a| prime << is_prime(a)}
  prime.compact
end

array = [1,2,3,4,5,6,7,89,10,11,12,13,14,19,17,23,37]
print only_prime(array) , "\n"