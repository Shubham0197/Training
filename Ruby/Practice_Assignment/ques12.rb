=begin
12. Given two strings s and part, perform the following operation on s until all occurrences of the substring
part are removed:
  Find the leftmost occurrence of the substring part and remove it from s.Return s after removing all
occurrences of part.
A substring is a contiguous sequence of characters in a string.
=end
def remove_occurrences(s, part)
  while s.match(part)
    s.sub!(part, '')
    print s, "\n"
  end
  s
end
