#Write a Ruby program to sort a string's characters alphabetically.

def check_string(str)
  return str.chars.sort.join
end

str = gets
print check_string(str)


#(base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$ ruby sort.rb
#happy

#ahppy(base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$ 