#This class should determine winning logic and all possible combinations

class Win

  def winning_combos
    winning_rows + winning_columns + winning_diagonals
  end

  def game_won?(symbol)
    winning_combos.any? { |row| row.count(symbol) == 3 }
  end

  def check_winner(player1, player2)
    @winner = player1 if game_won?(player1.symbol)
    @winner = player2 if game_won?(player2.symbol)
  end

  def draw?(current_symbol, opponent_symbol)
    (0..8).to_a.all? {|index| @spaces[index] != index} && !game_won?(current_symbol) && !game_won?(opponent_symbol)
  end

  def winning_rows
    @spaces.each_slice(3).to_a
  end

  def winning_columns
    @spaces.each_slice(3).to_a

    #winning_rows.transpose

  end

  def winning_diagonals
    [
      [ @spaces[0], @spaces[4] ,@spaces[8] ],
      [ @spaces[2], @spaces[4], @spaces[6] ]
    ]
  end
end
