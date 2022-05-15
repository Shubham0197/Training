=begin
37. Given a string s which consists of lowercase or uppercase letters, return the length of the longest 
palindrome that can be built with those letters.Letters are case sensitive, for example, "Aa" is not 
considered a palindrome here.
=end
def longest_palindrome(s)
  hash = Hash.new
  s.chars.each { |char| hash[char] = s.count(char) }
  odd = 0
  palindrome_length = 0
  hash.each { |key, value|
    if value.even?
      palindrome_length += value
    elsif hash[key].odd?
      palindrome_length += value - 1
      odd = 1
    end
  }
  palindrome_length + odd
end
