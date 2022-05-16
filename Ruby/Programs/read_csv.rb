require 'csv'
print CSV.read("test.csv")

csvfile = File.new("test.csv", "r+")
arr_line = []
arr = IO.readlines("test.csv",chomp: true)

#duplicating the values
for i in 0...arr.size
  arr_line << arr[i].split(",")
end

print arr_line,"\n"