# 35. You are given two strings of the same length s and t. In one step you can choose any character of t and 
# replace it with another character. Return the minimum number of steps to make t an anagram of s. An 
# Anagram of a string is a string that contains the same characters with a different (or the same) ordering.
module Anagram
  def self.min_step_anagram(s ,t)
    hash = t.chars.tally
    steps_remove = 0
    steps_add = 0
    steps = []
    s.chars.uniq.each { |char|
      if hash[char]
        if hash[char] > s.count(char)
          steps_remove += (hash[char] - s.count(char)).abs
        elsif hash[char] < s.count(char)
          steps_add += (hash[char] - s.count(char)).abs
        end
      else
        steps_add += s.count(char)
      end
    }
    steps << steps_remove << steps_add
    steps.max()
  end
end
