 # 24. Write a function which takes square matrix mat, return the sum of the matrix diagonals. 
# Only include the sum of all the elements on the primary diagonal and all the elements on the secondary 
# diagonal that are not part of the primary diagonal.
def sum_diagonals(mat)
  primary_diagonal_sum = 0
  secondary_diagonal_sum = 0
  length = mat.size
  for i in 0...mat.size
    primary_diagonal_sum += mat[i][i]
    secondary_diagonal_sum += mat[i][(length-1) - i]
  end
  total_sum = 0
  if mat.size.even?
    total_sum = primary_diagonal_sum + secondary_diagonal_sum
  else
    total_sum = primary_diagonal_sum + secondary_diagonal_sum - mat[(length-1)/2][(length-1)/2]
  end
  print primary_diagonal_sum, secondary_diagonal_sum , total_sum, "\n"
  total_sum
end

mat = [[1, 2, 3], [1, 2, 3], [1, 2, 3]]
sum_diagonals(mat)
