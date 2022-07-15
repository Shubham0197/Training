# Write a Ruby program to search items start with specified string of a given array.

arra1 = ['abcde', 'abdf', 'adeab', 'abdgse', 'bdefa', 'bacdef']
print "Original array:\n"
print arra1
print "\nSearch items start with 'ab':\n"
print arra1.grep(/^ab/)
print "\nSearch items start with 'b':\n"
print arra1.grep(/^b/)

=begin 
(base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$ ruby search.rb 
Original array:
["abcde", "abdf", "adeab", "abdgse", "bdefa", "bacdef"]
Search items start with 'ab':
["abcde", "abdf", "abdgse"]
Search items start with 'b':
["bdefa", "bacdef"](base) itsacheckmate@itsacheckmate:~/Training/Ruby/Practice$ 
=end
