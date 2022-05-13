# 6. Given a String S, reverse the string without reversing its individual words. Words are separated by dots.

def reverse_words(string)
  words_array = string.split('.')
  print words_array.reverse.join('.')
end

string = "helllo.world"
reverse_words(string)
