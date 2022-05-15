# 7. Given two strings s and t, return true if t is an anagram of s, and false otherwise.
module Anagram
  def Anagram.anagram?(s,t)
    hash_s = Hash.new
    hash_t = Hash.new
    (s.chars.uniq.sort).each { |char| hash_s[char] = s.count(char) }
    (t.chars.uniq.sort).each { |char| hash_t[char] = t.count(char) }
    print hash_s, hash_t, "\n"
    if hash_s == hash_t
      print "It is anagram", "\n"
    else
      print "Not a anagram" , "\n"
    end
  end
end

#s = 'car'
#t = 'rac'
#anagram?(s, t)
