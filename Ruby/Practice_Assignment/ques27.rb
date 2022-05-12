# 27. Given an integer array nums, move all the even integers at the beginning of the array followed by all the 
# odd integers. Return any array that satisfies this condition. 
def even_then_odd(array)
  transformed_array = []
  (0...array.size).each {|a| if array[a].even? then transformed_array << array[a] end }
  (0...array.size).each {|a| if array[a].odd? then transformed_array << array[a] end }  
  transformed_array
end

array = [2,4,6,4,6,8,5,4,6,8,5,3,2,4,67,89,9,7,5,3,5,7,8,6,4]
print even_then_odd(array) , "\n"
