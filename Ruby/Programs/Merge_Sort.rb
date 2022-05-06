def merge_sort(unsorted_array)
  if unsorted_array.length <= 1
    return unsorted_array
  else
    mid = unsorted_array.length / 2
    first_half = merge_sort(unsorted_array.slice(0...mid))
    second_half = merge_sort(unsorted_array.slice(mid...unsorted_array.length))
    merge(first_half, second_half)
  end
end

def merge(left_array, right_array)
  sorted_array = []
  while !left_array.empty? && !right_array.empty? do
    if left_array[0] < right_array[0]
      sorted_array.push(left_array.shift)
    else
      sorted_array.push(right_array.shift)
    end
  end
  return sorted_array.concat(left_array).concat(right_array)
end
