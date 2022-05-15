=begin
38. Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a 
given target value. 
If target is not found in the array, return [-1, -1].
=end
# Question done using array have to do with hash ????
module Range
  def self.search_range_using_array(nums, target)
    position = [-1, -1]
    if nums.rindex { |element| element == target }
      position[1] = nums.rindex { |element| element == target }
    end
    if nums.index { |element| element == target }
      position[0] = nums.index { |element| element == target }
    end
    position
  end
end
