#Game controls board, players, and moves
#Figure out a way to combine game and board logic to One
#This class should work on the logic behind a game
class Game

  attr_reader :player1, :player2, :board, :current_player, :winner

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @winner = nil
  end

  def new_game
     @current_player = @player1
     @opponent = @player2
     @board = @board
  end

  def play(index)
    change_turns if move(index, @current_player.symbol, @opponent.symbol)
  end

    def move(index, current_symbol, opponent_symbol)
      return false if illegal_moves(index, current_symbol, opponent_symbol)
      select_space(index, current_symbol)
    end

    def select_space(index, symbol)
      board.spaces[index] = symbol
    end

      def illegal_moves(index, current_symbol, opponent_symbol)
      space_taken?(index, current_symbol, opponent_symbol) #|| out_of_bounds?(index)
      end



      # def out_of_bounds?(index)
      #   index >= 9 || index < 0
      # end



      def space_taken?(index, current_symbol, opponent_symbol)
         space = board.spaces[index]
         space == current_symbol || space == opponent_symbol
      end

# Shouldnt be here ---game loop should be here board logic should be in board
  # def self.show_board
  # end

 # def game_over?(current_symbol, opponent_symbol)
 #   false
 #    #(game_won?(current_symbol) || game_won?(opponent_symbol) || draw?(current_symbol, opponent_symbol) )
 #  end

 def game_over?#(turns_remaining)
    return winner?# || draw?(turns_remaining)
 end

   def winner?
     rows = get_rows
     patterns = rows.push(*get_columns(rows), *get_diagonals(rows))
     winner = get_winner(patterns)
     set_winner(winner)

     return winner != ''
   end

     def get_rows
       board.spaces.each_slice(board.board_size).to_a
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
       #&& pattern[0] != board.empty_char
       return winning_pattern.length == 0 ? '' : winning_pattern[0]
     end

       def set_winner(winner)
         @winner = winner
       end

  # def game_won?(symbol)
  #   false
  # #   winning_combos.any? { |row| row.count(symbol) == 3 }
  #  end
  #
  # def draw?(current_symbol, opponent_symbol)
  #   (0..8).to_a.all? {|index| @spaces[index] != index} && !game_won?(current_symbol) && !game_won?(opponent_symbol)
  # end

  def self.update_game_status(player1, player2)
    byebug
    winner?
    @winner = @board.winner
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
  end
# That girls code to determine game over or not


#   def draw?(turns_remaining)
#     turns_remaining == 0
#   end
#

#

#

#

#
#   def clear_winner
#     @winner = ''
#   end
# end









#logic from board that can be comnined into this class
  #
  # def move(index, current_symbol, opponent_symbol)
  #   return false if illegal_moves(index, current_symbol, opponent_symbol)
  #   select_space(index, current_symbol)
  # end
  #
  # def self.show_board
  #   @spaces
  # end
  #
  # def game_over?(current_symbol, opponent_symbol)
  #   (game_won?(current_symbol) || game_won?(opponent_symbol) || draw?(current_symbol, opponent_symbol) )
  # end
  #
  # def all_available_spaces
  #   @available_spots = @spaces.select { |index| index.is_a?(Integer) }
  #   @available_spots
  # end
  #
  # def reset_space(space)
  #   @spaces[space] = space
  # end
  #
  # def illegal_moves(index, current_symbol, opponent_symbol)
  # space_taken?(index, current_symbol, opponent_symbol) || out_of_bounds?(index)
  # end
  #
  # private
  #
  # def out_of_bounds?(index)
  #   index >= 9 || index < 0
  # end
  #
  # def select_space(index, symbol)
  #   @spaces[index] = symbol
  # end
  #
  # def space_taken?(index, current_symbol, opponent_symbol)
  #    space = @spaces[index]
  #    space == current_symbol || space == opponent_symbol
  # end
