# Controls the flow of the game

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
  end

  def play(space)
    change_turns if @board.take_turn(space, @current_player.symbol)
  end

  def show_board
    @board.show_board
  end

  def illegal_moves(space)
    @board.illegal_moves(space)
  end

  def game_over?
    @board.game_over?
  end

  def game_tied?
    @board.tied?
  end

  def update_game_status
    @board.check_winner
    @winner = @board.winner
  end

  def change_turns
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end
end
