# Factorize a Number
# Create a function that takes a number as its argument and returns an array of all its factors.

def factorize(num)
  factors = []
  x = 1
  y = 0

  while x <= num
    if (num % x).zero?
      factors[y] = x
      y += 1
    end

    x += 1

  end

  puts factors
end

number = gets.to_i
factorize(number)
