# 20. Given an unsorted array Arr of size N of positive integers. One number 'A' from set {1, 2, ...N} is missing 
# and one number 'B' occurs twice in array. Find these two numbers.
def missing_repeated(arr)
  missing = nil
  repeated = nil
  arr_uniq = arr.uniq.sort 
  a = 0
  while a < arr_uniq.size - 1
    if arr_uniq[a] != arr_uniq[a + 1] - 1 then missing = arr_uniq[a] + 1 end
    if arr.count(arr_uniq[a]) > 1 then repeated = arr_uniq[a] end
    a += 1 
  end
  print  "missing no is ", missing, " repeated no is", repeated, "\n"
end

arr = [1,2,3,4,6,7,8,8,9]
missing_repeated(arr)
