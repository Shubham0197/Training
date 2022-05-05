# Odd Up, Even Down — N Times
=begin
Create a function that performs an even-odd transform to an array, n times. Each even-odd transformation:

Adds two (+2) to each odd integer.
Subtracts two (-2) from each even integer.
=end
def even_odd_transform(arr, n)

  for x in 1..n
    for i in 0...arr.length
      if (arr[i] % 2).zero?
        arr[i] -= 2
      else
        arr[i] += 2
      end
    end
  end

  arr
end

=begin
output:
Test Passed: Value == [9, -2, 15]
Test Passed: Value == [-20, -20, -20]
Test Passed: Value == [3, 0, 5]
Test Passed: Value == [59, 86, 826]
=end
