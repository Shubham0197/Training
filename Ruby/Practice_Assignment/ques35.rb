# 35. You are given two strings of the same length s and t. In one step you can choose any character of t and 
# replace it with another character. Return the minimum number of steps to make t an anagram of s. An 
# Anagram of a string is a string that contains the same characters with a different (or the same) ordering.
module Anagram
  def self.min_step_anagram(s ,t)
    hash = Hash.new
    steps = 0
    t.chars.each {|char| hash[char] = t.count(char)}
    s.chars.uniq.each {|char| if hash[char] then steps += (hash[char] - s.count).abs else steps += s.count end}
    steps
    end
end
