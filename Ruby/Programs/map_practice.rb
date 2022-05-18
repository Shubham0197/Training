=begin
Map useful for creating array out of the object which is enumerable thorugh 
appling some logic in the process for manipulation
=end
def make(x)
  final_result = []
  x.times do |i|
    row_elements = []
    (i + 1).times do |j|
      row_elements << i + 1
    end
    final_result << row_elements    
  end
  final_result + final_result.reverse.last(x-1)
end

array = make(5)

print array,"\n"

sum_lines = array.map{|line| line.sum()}
# here used map to on array which is enumerable on each element in it
# and replcaing the need to use each loop
print sum_lines,"\n"

# only one if block can be used 