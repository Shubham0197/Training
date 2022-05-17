=begin
each_with_object
Useful for creating an object by iterating over an enumerable.
For example, what if we wanted to produce a hash from an array?
 Or a Person object from a given hash?
 Unlike map, you can add ifs to the block and pick and choose which elements to run the logic on.
=end

def build_hash(nums)
  # it receives the object to start with ({}) and accumulates on top of it
  nums.each_with_object({}) { |num, res| res[num] = (num) }
end

# bonus: works with any kind of object
def build_array(nums)
  # the accumulator can be an array, or any object really.
  nums.each_with_object([]) { |num, res| res << (num) }
end

nums= [1, 4, 9, 16, 25, 16, 9, 4, 1]
print build_hash(nums), "\n"
print build_array(nums), "\n"

#output
#{1=>1, 4=>4, 9=>9, 16=>16, 25=>25}
#[1, 4, 9, 16, 25, 16, 9, 4, 1]