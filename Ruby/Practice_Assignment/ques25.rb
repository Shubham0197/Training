# 25. Given an array nums of size n, return the majority element. The majority element is the element that 
# appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

def find_majority_element(array)
  array.sort!
  array[array.size / 2]
end

array = [1, 1, 1, 1, 23, 4, 4]
print find_majority_element(array), "\n"
