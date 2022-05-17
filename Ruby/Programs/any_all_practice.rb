=begin
any? checks that at least one element in an enumerable corresponds to a condition.
all? verifies that all elements fit the bill.
=end

def easier_all_odds?(nums)
  nums.all?(&:odd?)
end

def easier_any_greater_than?(nums, x )
  nums.any? { |num| num > x }
end

nums = [1, 4, 9, 16, 25, 16, 9, 4, 1]

print easier_all_odds?(nums),"\n"
print easier_any_greater_than?(nums,4),"\n"

#output
#false
#true

=begin
find_index
Sometimes, you just need to find the index of an element matching a condition:
=end
def find_num(nums, x)
  nums.find_index(4)

end
print find_num(nums, 4), "\n"
print (1..100).find_index(50)   
