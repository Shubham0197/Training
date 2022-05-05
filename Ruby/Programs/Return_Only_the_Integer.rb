# Return Only the Integer
# Write a function that takes an array of elements and returns only the integers.
#

def return_only_integer(arr)
  intarr = []
  i = 0
  j = 0

  loop do
    if arr[i].is_a?(Integer)
      intarr[j] = arr[i]
      j += 1
    end
    i += 1
    break if i == arr.length
  end
  intarr
end
