# Reverse Coding Challenge #3
# Your task is to create a function that, when fed the inputs below, produces the sample outputs shown.

def mystery_func(arr, num)
  i = 0
  loop do
    arr[i] = arr[i] % num
    i += 1
    break unless i == arr.length
  end
  arr
end
