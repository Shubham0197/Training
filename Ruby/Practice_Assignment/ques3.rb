# 3. Given a string s, reverse only all the vowels in the string and return it.The vowels are 'a', 'e', 'i', 'o', and 'u', 
# and they can appear in both cases.
def reverse_vowels(string)
  vowels_array = []
  string.chars.each {|char| if 'aeiou'.include? char.downcase then vowels_array << char end }
  length = string.size
  reverse_vowels = vowels_array.reverse
  counter = 0
  (0...length).each {|index| 
    if 'aeiou'.include? string[index].downcase 
      string[index] = reverse_vowels[counter]
      counter += 1
    end
  }
  print string, "\n"
  string
end

string = "hello world"
reverse_vowels(string)
