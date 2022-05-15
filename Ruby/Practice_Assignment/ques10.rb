# 10. Given a string s and an array of strings words, determine whether s is a prefix string of words. 
# A string s is a prefix string of words if s can be made by concatenating the first k strings in words for some 
# positive k no larger than words.length. Return true if s is a prefix string of words, or false otherwise.
def is_prefix_string(s, words)
  joined = ''
  index = 0
  while index < words.size
    joined << words[index]
      if s == joined
        return true
      end
    index += 1
  end
  false
end
