#Write a Ruby program to insert a string of length 2 to an another string where the first string will be in the middle of the second string.
def make_word(str1, str2)
  "#{str1[0...str1.length/2]}#{str2}#{str1[str1.length/2..-1]}"
end


str1 = gets.chomp
str2 = gets.chomp
print make_word(str1, str2)

=begin
(base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$ ruby middle_add.rb 
shuham
b
shubham(base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$   
=end