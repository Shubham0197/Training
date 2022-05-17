=begin
select/reject
select iterates over an enumerable and returns only the elements that answer the given block. 
rejects acts the same but opposite, it returns the ones that don’t answer the condition
=end

def only_odds(nums)
  nums.select(&:odd?)
end

### reject ###
# exact opposite of `select`
def only_evens(nums)
  nums.reject(&:odd?)
end

nums = [1, 4, 9, 16, 25, 16, 9, 4, 1]

print only_odds(nums),"\n"
print only_evens(nums),"\n"

#output
#[1, 9, 25, 9, 1]
#[4, 16, 16, 4]