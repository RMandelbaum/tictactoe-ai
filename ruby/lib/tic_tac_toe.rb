#This class controls a game cycle from beginning to end. Starts with game type and continuosly checks if game is over
#The main class that interacts with the UI

require_relative 'game'
require_relative 'ui/board_builder'
require_relative 'ui/player_input'
require_relative 'ui/new_game'
require_relative 'player'
require_relative 'computer'
require_relative 'helpers/tic_tac_toe'

class TicTacToe

  attr_accessor :game

  #initialize TicTacToe
  def initialize
    @game = nil
    @new_game = NewGame.new
    @player_input = PlayerInput.new
  end

  #Begins game/triggers UI class
  def game_loop
    @new_game.welcome
    set_game_type
    until @game.game_over? do
     @player_input.player_turn(@game) if @player1 || @player2
     @computer.play(game) if @computer1
    end
     @game.winner?
     @player_input.end_of_game(@game)
  end

  #allows user to choose type of game
  #All methods calls the UI class, uncoupled
  def set_game_type
    loop do
      game_type = @new_game.get_game_type
      case game_type
       when 1
        player_vs_player
        break
       when 2
        player_vs_computer
        break
       when 3
        computer_vs_computer
        break
        end
    end
  end

#Game types:
  def two_player_game
    @game = Game.new(Player.new(@player1, @first_symbol), Player.new(@player2, @second_symbol), BoardBuilder.new(@board_size))
    @game.new_game
  end

  def player_vs_computer_player_first
    @computer = Computer.new(@computer1, @computer1_symbol)
    @game = Game.new(Player.new(@player1, @first_symbol), @computer, BoardBuilder.new(@board_size))
    @game.new_game
  end

  def player_vs_computer_computer_first
    @computer = Computer.new(@computer1, @computer1_symbol)
    @game = Game.new(@computer, Player.new(@player1, @first_symbol), BoardBuilder.new(@board_size))
    @game.new_game
  end

  def computer1_vs_computer2
    @game = Game.new(Computer.new(@computer1, "X"), Computer.new(@computer2, "O"), BoardBuilder.new(@board_size))
    @game.new_game
  end

end
