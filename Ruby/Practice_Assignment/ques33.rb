# 33. Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range 
# that is missing from the array. 
module Missing_no
  def Missing_no.missing_no(array)
    hash = Hash.new
    (0..array.size).each { |no| hash[no] = array.count(no) }
    return hash.key(0)
  end
end
