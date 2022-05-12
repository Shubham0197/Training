#Given an array of integers nums, return the number of good pairs. 
#A pair (i, j) is called good if nums[i] == nums[j] and i < j
def good_pair(arr)
  arr_uniq = arr.uniq
  occurence = []
  no_of_good_pairs = 0
  arr_uniq.each {|a| occurence << arr.count(a) }
  occurence.each {|a| no_of_good_pairs += (a * (a - 1)) / 2; }
  no_of_good_pairs
end
array = [2,4,5,7,9,6,4,3,5,7,8,6,5,4,3,22]
print good_pair(array),"\n"
