=begin
partition is used to do, in one line, split an array into two arrays,
 based on a condition.
=end

def odd_even_short(nums)
  nums.partition(&:odd?)
end

nums = [1, 4, 9, 16, 25, 16, 9, 4, 1]

print odd_even_short(nums)

#output
#[[1, 9, 25, 9, 1], [4, 16, 16, 4]]