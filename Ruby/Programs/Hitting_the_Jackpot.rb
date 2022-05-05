# Hitting the Jackpot
# Create a function that takes an array (slot machine outcome) and returns true if all elements in the array are identical, and false otherwise. The array will contain 4 elements.

def test_jackpot(result)
  x = 0
  for i in 1...result.length
    if result[0] != result[i]
      x = 1
    end
  end
  x.zero?
end

=begin 
Test Passed: Value == true
Test Passed: Value == true
Test Passed: Value == true
Test Passed: Value == true
Test Passed: Value == true
Test Passed: Value == false
Test Passed: Value == false
Test Passed: Value == false
Test Passed: Value == false
=end
