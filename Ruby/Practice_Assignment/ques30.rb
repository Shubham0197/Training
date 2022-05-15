# 30. A pangram is a sentence where every letter of the English alphabet appears at least once. 
# Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or 
# false otherwise
module Panagram
  def self.panagram?(string)
    hash = Hash.new
    ('a'..'z').each { |char| hash[char] = string.count(char) }
    if hash.key(0)
      false
    else
      true
    end
  end
end