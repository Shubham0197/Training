# 16. Given an integer limit being the upper limit of the range of interest, implement a function that returns the 
# last 15 palindromes numbers lower or equal to limit as an array sorted ascendingly. 

def palindrome_num(no)
  palindrome_array = []
  (no.downto(11)).each { |a| if (a.to_s == a.to_s.reverse) then palindrome_array << a end } 
  palindrome_array[0...15].sort
end

print "Enter the no : "
no = gets.to_i
print palindrome_num(no), "\n"