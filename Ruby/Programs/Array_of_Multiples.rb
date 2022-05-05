# Array of Multiples
# Create a function that takes two numbers as arguments (num, length) and returns an array of multiples of num until the array length reaches length.

def array_of_multiples (num, length)
  arr = []
  x = 0
  while x < length
    arr[x] = num * (x + 1)
    x += 1
  end

  arr
end
