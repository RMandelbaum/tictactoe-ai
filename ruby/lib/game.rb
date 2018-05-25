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
    change_turns if @board.move(index, @current_player.symbol, @opponent.symbol)
  end

# Shouldnt be here ---game loop should be here board logic should be in board
  def self.show_board
  end

  def illegal_moves(space)
    @board.illegal_moves(space)
  end

  def game_over?(current_symbol, opponent_symbol)
    @board.game_over?(current_symbol, opponent_symbol)
  end

  def game_draw?
    @board.draw?
  end

  def update_game_status(player1, player2)
    @board.check_winner(player1, player2)
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
