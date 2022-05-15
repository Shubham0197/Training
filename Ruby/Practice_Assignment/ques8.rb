# 8. A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all 
# non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include 
# letters and numbers. Given a string s, return true if it is a palindrome, or false otherwise
module Palindrome
  def Palindrome.is_palindrome(string)
    string_modified = string.gsub(/[\W_]/i, "").downcase
    if string_modified == string_modified.reverse
      return true
    else
      false
    end
  end
end
