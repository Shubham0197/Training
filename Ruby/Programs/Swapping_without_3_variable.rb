# swapping 2 numbers without third variable
module Swap
  def swap(a,b)
    a = a + b
    b = a - b
    a = a - b
    puts a,b
  end
end

