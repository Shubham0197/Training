# Write a Ruby program to remove a specified character into a given string.
def check_string(str,chr)
  return str.tr(chr, '')
end

str = gets
chr = gets
print check_string(str,chr)

=begin
  (base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$ ruby removechar.rb 
shubham
a
shubhm(base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$ 
  
=end