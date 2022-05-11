# 40. Write a function which takes year and returns how many Saturday 14ths there are in a given year.

def staurday_of_14(int)
  count = 0
  (1..12).each do |i|
    t = Time.new(int, i, 14)
    if t.saturday?
      count += 1
    end
  end
  puts "No of saturdays in #{int} year is #{count}"
end

print 'Enter the year to find out the no of saturdays which come ont 14th date '
year = gets.to_i
staurday_of_14(year)
