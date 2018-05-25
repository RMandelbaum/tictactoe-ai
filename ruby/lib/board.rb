#stores moves on board, logic for game over/win/tie
require_relative './ui/board_builder'

class Board

  attr_reader :spaces, :winner

  def initialize(board_size)
    @board_size = board_size
    @spaces = BoardBuilder.calculate_amount_board_spaces(board_size)
    @winner = nil
  end

  def move(index, current_symbol, opponent_symbol)
    return false if illegal_moves(index, current_symbol, opponent_symbol)
    select_space(index, current_symbol)
  end

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

  def self.show_board
    @spaces
  end

  def game_over?(current_symbol, opponent_symbol)
    (game_won?(current_symbol) || game_won?(opponent_symbol) || draw?(current_symbol, opponent_symbol) )
  end

  def all_available_spaces
    @available_spots = @spaces.select { |index| index.is_a?(Integer) }
    @available_spots
  end

  def reset_space(space)
    @spaces[space] = space
  end

  def illegal_moves(index, current_symbol, opponent_symbol)
  space_taken?(index, current_symbol, opponent_symbol) || out_of_bounds?(index)
  end

  private

  def out_of_bounds?(index)
    index >= 9 || index < 0
  end

  def select_space(index, symbol)
    @spaces[index] = symbol
  end

  def space_taken?(index, current_symbol, opponent_symbol)
     space = @spaces[index]
     space == current_symbol || space == opponent_symbol
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
