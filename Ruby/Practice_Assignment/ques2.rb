# 2. Write a function to return reverse of a string using recursion.
def reverse_recursion (string)
  if string.length <= 1 then return string end

  last = string[-1]
  string = string[0...-1]
  string = reverse_recursion(string)
  last + string 
end

string = "hello world"
print reverse_recursion(string) , "\n"
