# 32. Given a string s, return true if s is a good string, or false otherwise. A string s is good if all the characters 
# that appear in s have the same number of occurrences (i.e., the same frequency).
module Good_string
  def Good_string.is_good_string(string)
    hash = Hash.new
    string.chars.each { |char| hash[char] = string.count(char) }
    hash.values.all?(hash.value[0])
  end
end
