=begin
22. Given an integer array nums and an integer k, return the number of pairs (i, j) where i < j such that 
|nums[i] - nums[j]| == k. 
The value of |x| is defined as:    
 x if x >= 0. 
  -x if x < 0.
=end

def pair_difference_k(num, k)
  length = num.size
  no_of_pairs = 0
  for i in (0...length)
    for j in (i...length)
      if (num[i] - num[j]).abs == k
        no_of_pairs += 1
      end
    end
  end
  print no_of_pairs , "\n"
end

nums = [1,2,34,54,6,4,3,32,2,1,1,2,3,4,3,4,5,4,3,4,5,4,2,1,1,1,2,4,5,6,6,5,4]
k = 2
pair_difference_k(nums, k)