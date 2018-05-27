#This class holds the logic behind a game
class Game

  attr_reader :player1, :player2, :board, :current_player, :winner
  attr_accessor :turns_remaining

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @winner = nil
    @turns_remaining = @board.spaces.count
  end

  def new_game
     @current_player = @player1
     @opponent = @player2
     @board = @board
  end

  def play(index)
    change_turns if move(index, @current_player.symbol, @opponent.symbol)
  end

  def change_turns
    if @current_player == @player1
       @current_player = @player2
       @opponent = @player1
    else
       @current_player = @player1
       @opponent = @player2
    end
   end

  def move(index, current_symbol, opponent_symbol)
    return false if illegal_moves(index, current_symbol, opponent_symbol)
    select_space(index, current_symbol)
    @turns_remaining = turns_remaining - 1
  end

  def select_space(index, symbol)
    board.spaces[index] = symbol
  end

  def reset_space(game, space)
    board.spaces[space] = space
  end

  def illegal_moves(index, current_symbol, opponent_symbol)
    space_taken?(index, current_symbol, opponent_symbol) || out_of_bounds?(index)
  end

  def out_of_bounds?(index)
    index >= board.spaces.length || index < 0
  end

  def space_taken?(index, current_symbol, opponent_symbol)
     space = board.spaces[index]
     space == current_symbol || space == opponent_symbol
  end


## Methods to see if game is won, over, tied, calculates winning combos [Could be own class, but for now it is all in one class]
  def game_over?
    return winner? || draw?
  end

  def get_rows
     board.spaces.each_slice(board.board_size).to_a
  end

 def winner?
   rows = get_rows
   patterns = rows.push(*get_columns(rows), *get_diagonals(rows))
   winner = get_winner(patterns)
   set_winner(winner)
   return winner != ''
 end



 def get_columns(rows)
   rows.transpose
 end

 def get_diagonals(rows)
    [] << rows.each_with_index.map { |row, i| row[i]} <<
       rows.each_with_index.map { |row, i| row[(board.board_size - 1) - i]}
 end

 def get_winner(patterns)
   winning_pattern = patterns.each.select { |pattern| pattern.uniq.length == 1  }.flatten
   return winning_pattern.length == 0 ? '' : winning_pattern[0]
 end

 def set_winner(winner)
   @winner = winner
 end

 def self.update_game_status(player1, player2)
   winner?
   @winner = @board.winner
 end

 def draw?
   @turns_remaining == 0
 end

end
