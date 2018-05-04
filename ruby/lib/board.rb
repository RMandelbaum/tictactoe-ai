# Determines the winner by storing the moves

class Board

  attr_reader :spaces, :winner

  def initialize
    @spaces = [0,1,2,3,4,5,6,7,8]
    @winner = nil
  end

  def take_turn(space, player)
    #return false if illegal_moves(space)
    select_space(space, player)
  end

  def all_winning_possibilities
    winning_rows + winning_columns + winning_diagonals
  end

  def game_won?(player)
    all_winning_possibilities.any? { |row| row.count(player) == 3 }
  end

  def check_winner
    @winner = "X" if game_won?("X")
    @winner = "O" if game_won?("O")
  end

  def tied?
    (0..8).to_a.all? {|space| @spaces[space] != space} && !game_won?("X") && !game_won?("O")
  end

  def show_board
    @spaces
  end



  def game_over?
    (game_won?("X") || game_won?("O") || tied? )
  end

  def all_available_spaces
    @spaces.select { |space| !space_taken(space) }
  end

  def reset_space(space)
    @spaces[space] = space
  end

  # def illegal_moves(space)
  #   space_taken(@spaces[space]) || out_of_bounds(space)
  # end

  private

  def out_of_bounds(space)
    space >= 9 || space < 0
  end

  def select_space(space, player)
    @spaces[space] = player
  end

  # def space_taken(space)
  #   space == @game.player1.symbol || space == @game.player2.symbol
  #   binding.pry
  # end

  def winning_rows
    @spaces.each_slice(3).to_a
  end

  def winning_columns
    winning_rows.transpose
  end

  def winning_diagonals
    [
      [ @spaces[0], @spaces[4] ,@spaces[8] ],
      [ @spaces[2], @spaces[4], @spaces[6] ]
    ]
  end

end
