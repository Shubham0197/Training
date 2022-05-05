# creating program for finding if a number is prime or not

  def is_a_prime(num)
    i = 2
    c = 0

    loop do
      if (num % i).zero?
        c = 1
      end
      i += 1
      break if i == (num - 1)
    end

    if c == 1
      puts 'given no is not a prime no.'
    else
      puts 'given no is prime'
    end
  end
  num = gets.to_i
  is_a_prime(num)
