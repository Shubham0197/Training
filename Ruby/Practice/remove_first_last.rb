# Write a Ruby program to remove the first and last two characters from a specified string.
def check_string(str)
  str = str[2...-2]
  return str
end

str = gets
print check_string(str)

=begin
(base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$ ruby remove_first_last.rb 
shubham
ubha(base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$   
=end