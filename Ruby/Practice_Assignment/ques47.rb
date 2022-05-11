# Given the month and year as numbers, return whether that month contains a Friday 13th.

def friday_of_13(year, month)
  t = Time.new(year, month, 13)
  if t.friday?
    puts "This month contains 13th date as Friday"
  else
    puts "This month  does not contains 13th date as Friday"
  end
end

print "Enter the year to find out the 13th date is friday\n Year:"
year = gets.to_i
print "\n month "
month = gets.to_i
friday_of_13(year, month)
