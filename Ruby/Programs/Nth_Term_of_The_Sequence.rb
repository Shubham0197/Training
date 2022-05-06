# The Nth Term of the Sequence
=begin
Write a function containing an expression, in terms of n, for the nth term of the sequence that has the following first six terms:
2, 6, 13, 23, 36, 52 ...and the sequence continues.
=end
def seq(n)
  if n.zero?
    return 2
  end
  level1 = 2 # level1 sequence
  level2 = 4 # level2 sequence

  (1...n).each do 
    level1 += level2
    level2 += 3
  end
  return level1
end

Nth_Term = seq(0)
puts Nth_Term
