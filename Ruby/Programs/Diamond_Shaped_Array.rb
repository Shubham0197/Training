# Diamond Shaped Array
# Create a function that returns an array that expands by 1 from 1 to the value of the input, and then reduces back to 1. Items in the lists will be the same as the length of the lists.
def diamond_arrays(x)
  arr_result = []
  arr_intermideate = []

  x.times do |i|
    arr_intermideate = []
    (i + 1).times do |j|
      arr_intermideate[j] = i + 1
    end
    arr_result << arr_intermideate
    print arr_intermideate, "\n"
  end

  (x - 1).downto(1) do |i|
    arr_intermideate = []

    i.times do |j|
      arr_intermideate[j] = i
    end
    arr_result << arr_intermideate
    print arr_intermideate, "\n"
  end
  print arr_result
end

diamond_arrays(5)
