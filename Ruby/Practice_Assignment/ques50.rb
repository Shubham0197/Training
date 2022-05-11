#  If today was Monday, in two days, it would be Wednesday. 
# Create a function that takes in an array of days as input and the number of days to increment by. Return an 
# array of days after n number of days has passed. 
# after_n_days(["Thursday", "Monday"], 4) ➞ ["Monday", "Friday"]
require 'date'

def after_n_days(day, no)
  days_of_week = Date::DAYNAMES
  (0..6).each { |i|
    if day == days_of_week[i]
      x = i + no
      while x > 6
        x -= 7
      end
      return days_of_week[x]
    end
  }
end

def array_after_n_days(days, no)
  n = days.size
  (0...n).each { |i|
    days[i] = after_n_days(days[i], no)
  }
  print days
end

day_array = ["Thursday","Monday"]
passed_days = 4

array_after_n_days(day_array, passed_days)
