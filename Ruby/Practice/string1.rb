# Write a Ruby program to set 5 to 1 if there is a 3 immediately followed by a 5 in a given array of integers (length 3)
def check_array(nums)
  num1 = nums[0], nums[1], nums[2]
if(nums[0] == 3 && nums[1] == 5)
   num1[1] = 1;
end		
if(nums[1] == 3 && nums[2] == 5)
   num1[2] = 1;
end		
return num1;
end
print check_array([1, 3, 5]),"\n" 
print check_array([3, 5, 6]),"\n" 
print check_array([3, 9, 5]),"\n" 