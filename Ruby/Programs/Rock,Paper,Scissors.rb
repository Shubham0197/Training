# Rock, Paper, Scissors!
=begin 
Abigail and Benson are playing Rock, Paper, Scissors.

Each game is represented by an array of length 2, where the first element represents what Abigail played and the second element represents what Benson played.

Given a sequence of games, determine who wins the most number of matches. If they tie, output "Tie".

R stands for Rock
P stands for Paper
S stands for Scissors
=end

def calculate_score(games)
  
  abigail = 0
  benson = 0

  for i in 0...games.length
    case
    when games[i][0] == 'R' && games[i][1] == 'P'
      benson += 1
    when games[i][0] == 'R' && games[i][1] == 'S'
      abigail += 1
    when games[i][0] == 'P' && games[i][1] == 'R'
      abigail += 1
    when games[i][0] == 'P' && games[i][1] == 'S'
      benson += 1
    when games[i][0] == 'S' && games[i][1] == 'R'
      benson += 1
    when games[i][0] == 'S' && games[i][1] == 'P'
      abigail += 1
    end
  end

  if abigail > benson
    puts 'Abigail'
  elsif benson > abigail
    puts 'Benson'
  else
    puts 'Tie'
  end

end

calculate_score([['R', 'P'], ['R', 'S'], ['S', 'P']])

