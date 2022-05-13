# Create a function that takes an array of strings and integers, and filters out the array so that it returns an 
# array of integers only
def only_string(array)
  int_array = []
  array.each {|a| if a.class == Integer then int_array << a end }
  print int_array, "\n"
end

array = ['a', 1, 3, 5, 8, 's', 'df']
only_string(array)
