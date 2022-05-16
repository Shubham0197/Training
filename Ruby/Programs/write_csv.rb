csvfile = File.new("test.csv", "a+")
arr_line = []
arr = IO.readlines("test.csv",chomp: true)

for i in 1...arr.size
  arr_line << arr[i].split(",")
end

print arr_line,"\n"

array_string_line = []
for i in 0...arr_line.size
  print arr_line[i],"\n"
  array_string_line << arr_line[i].join(",")
end

csvfile.puts("\n")
for i in 0...array_string_line.size-1
  csvfile.puts(array_string_line[i])
end
csvfile.write(array_string_line[array_string_line.size-1])
