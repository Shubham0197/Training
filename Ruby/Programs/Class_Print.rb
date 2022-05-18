def print_each_class(array)
  array.each { |var| print var, ' - ', var.class, "\n" }
end

array = [1, 2, 3, 'asd']
print_each_class(array)
