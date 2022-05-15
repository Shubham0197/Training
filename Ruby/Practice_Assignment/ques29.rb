=begin
29. Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M. 
Symbol       Value 
       I             1 
V             5 
X             10 
L             50 
C             100 
D             500 
M             1000 
Write a function which takes roman number and return integer corresponding to that roman number.
=end
def roman_to_int(roman_no)
  hash = { 'I'=> 1, 'V'=> 5, 'X'=> 10, 'L'=> 50, 'C'=> 100, 'D'=> 500, 'M'=> 1000 }
  result = 0
  i = 0
  while i < roman_no.length
    if i + 1 < roman_no.length and hash[roman_no[i]] < hash[roman_no[i+1]]
      result += hash[roman_no[i+1]] - hash[roman_no[i]]
      i += 1
    else
      result += hash[roman_no[i]]
    end
    i += 1
  end
  result
end
