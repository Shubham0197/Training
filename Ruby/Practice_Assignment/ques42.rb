#42. Create a function that takes time1 and time2 and return how many hours and minutes have passed between the two times.
require 'time'
def time_passed(time1, time2)
  time_passed = time2 - time1
  if time_passed.positive?
    time_passed
  else
    time_passed = 24 * 3600 + time_passed
  end
  puts time1, time2
  print (time_passed / 3600).to_i, " hours and ", (time_passed % 3600) / 60, " minutes difference is there \n"
end

print "Enter the time to find difference \n Time start :"
time1 = gets
print "\nTime end:"
time2 = gets
time1 = Time.strptime(time1, "%k:%M")
time2 = Time.strptime(time2, "%k:%M")

time_passed(time1, time2)
