=begin
Similiar to each_with_object but it is also taking index with value
Useful when, in addition to iterating over an enumerable, 
you also need to use the index. For example, 
what if we need to log the current index we’re processing?
=end

# better: much more readable
def handle(nums)
  nums.each_with_index do |num, i|
    puts ("Handling item #{num}/#{i}/#{nums.count}")
  end
end

nums = [1, 4, 9, 16, 25, 16, 9, 4, 1]

handle(nums)
