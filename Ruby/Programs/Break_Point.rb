# Break Point
=begin
A number has a breakpoint if it can be split in a way where the digits on the left side and the digits on the right side sum to the same number.
For instance, the number 35190 can be sliced between the digits 351 and 90, since 3 + 5 + 1 = 9 and 9 + 0 = 9. On the other hand, the number 555 does not have a breakpoint (you must split between digits).
Create a function that returns true if a number has a breakpoint, and false otherwise.
=end

def break_point(num)
  x = 0
  arr = num.to_s.split('')
  arr.each do |i|
    arr[x] = i.to_i
    x += 1
  end

  x = 0


  flag = 0

  (1...arr.length).each do |i|
    sum1 = 0
    sum2 = 0
    (0...i).each do |x|
      sum1 += arr[x]
    end
    print sum1
    (i...arr.length).each do |y|
      sum2 += arr[y]
    end
    puts sum2
    if sum1 == sum2
      flag = 1
    end
  end

  if flag.zero?
    print false
  else
    print true
  end
end

break_point(159780)
