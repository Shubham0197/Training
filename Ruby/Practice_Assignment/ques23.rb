# 23. Given an array nums. We define a running sum of an array as running Sum[i] = sum( nums[0]...nums[i]). 
# Return the running sum of nums.

def running_sum(array)
  running_sum_array = []
  running_sum_array << array[0]
  (1...array.size).each { |a| running_sum_array << array[0..a].sum }
  running_sum_array
end

array = [1,2,3,4,5,6,7,10,11,12,13,14,19,17,23,37]
print running_sum_array(array) , "\n"
