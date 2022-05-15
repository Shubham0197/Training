=begin
36. Given a string text, you want to use the characters of text to form as many instances of the word "balloon" 
as possible. You can use each character in text at most once. Return the maximum number of instances 
that can be formed. 
Example:   loonballxballpoon  
You can create only 2 balloon from example text, so return 2 
=end
module Baloon_charachter_occurence
  def self.no_of_ballon(text)
    hash = Hash.new
    text.chars.uniq.each {|char| hash[char] = text.count(char)}
    print hash, "\n"
    length = []
    'balon'.chars.each {|char| 
      if char =~ /[lo]/ and hash[char]
        length << hash[char] / 2
      elsif hash[char]
        length << hash[char]
      else
        return 0
      end
    }
    length.min
  end
end
