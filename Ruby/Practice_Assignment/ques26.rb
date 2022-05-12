# 26. A distinct string is a string that is present only once in an array. Given an array of strings arr, and an integer 
# k, return the kth distinct string present in arr. If there are fewer than k distinct strings, return an empty  string "". 
# Note that the strings are considered in the order in which they appear in the array.
def kth_distint_string(arr, k)
  distinct_string_array = []
  arr.uniq.each {|a| if arr.count(a) == 1 then distinct_string_array << a end }
  if k <= distinct_string_array.size 
    distinct_string_array[k-1]
  else
    return ""
  end
end

array = ['a', 'b', 'c', 'd', 'a']
k = 5
print kth_distint_string(array, k) , "\n"
