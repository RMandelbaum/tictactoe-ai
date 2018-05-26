#This class controls a game cycle from beginning to end. Starts with game type and continuosly checks if game is over
# The main class that interacts with the UI

require_relative 'game'
require_relative 'board'
require_relative 'ui/board_builder'
require_relative 'ui/player_input'
require_relative 'player'
require_relative 'computer'
require_relative 'ui/new_game'


#Tic Tac Toe Main
class TicTacToe

  attr_accessor :game

#initialize TicTacToe
  def initialize
    @game = nil
  end

#Begins game/triggers UI class
  def game_loop
    NewGame.welcome
    set_game_type
     until @game.game_over? do #(@game.player1.symbol, @game.player2.symbol) do
      PlayerInput.player_turn(@game) if @player1 || @player2
      PlayerInput.computer_turn if @computer1 #== "Computer"
     end
      @game.winner?
      PlayerInput.end_of_game(@game)
  end

def set_game_type
  loop do
  game_type = NewGame.get_game_type
  case game_type
    when 1
      @player1 = NewGame.get_first_player
      @player2 = NewGame.get_second_player
      @first_symbol = NewGame.get_first_symbol
      @second_symbol = NewGame.get_second_symbol
      board_type = NewGame.get_board_type
      @board_size = board_type.board_size
      two_player_game
      break
    when 2
      @player1 = NewGame.get_one_player
      @first_symbol = NewGame.get_first_symbol
      # @computer1 = "Bob the Computer (-_(-_(-_(-_-)_-)_-)_-) "

      @play_order = NewGame.play_order_prompt
      if @play_order == 1
        player_vs_computer_player_first
      else
        player_vs_computer_computer_first
      end
      break
    when 3
      @computer1 = "Bob the Computer (-_(-_(-_(-_-)_-)_-)_-) "
      @computer2 = "Sally the Machine [^()^] "
      puts "Check out these computers. Place your bets on #{@computer1} vs #{@computer2}!"
      computer_vs_computer
      break
    else
      puts "Hmm you entered something I do not recognize. - 1, 2 or 3"
    end
end
end
#
# #asks for play order
#   def play_order_prompt
#     puts "Choose who goes first: "
#     puts " -1- #{@player1}"
#     puts " -2- #{@computer1}"
#     play_order
#   end
#
# #play order for player_vs_computer
#   def play_order
#     loop do
#       starting_player = gets.strip.to_i
#       case starting_player
#       when 1
#         puts "Start us up, #{@player1}!"
#         set_computers_symbol
#         player_vs_computer_player_first
#         break
#       when 2
#         puts "Start us up, #{@computer1}!"
#         @computer1_symbol = "X"
#         player_vs_computer_computer_first
#         break
#       else
#         puts "Hmm you entered something I do not recognize. 1 or 2?"
#       end
#     end
#   end

#Game types:
  def two_player_game
    @game = Game.new(Player.new(@player1, @first_symbol), Player.new(@player2, @second_symbol), BoardBuilder.new(@board_size))
    create_new_game
  end

  def player_vs_computer_player_first
    @game = Game.new(Player.new(@player1, @first_symbol), Computer.new(@computer1, @computer1_symbol), BoardBuilder.new(@board_size))
    create_new_game
  end

  def player_vs_computer_computer_first
    @game = Game.new(Computer.new(@computer1, @computer1_symbol), Player.new(@player1, @first_symbol), BoardBuilder.new(@board_size))
    create_new_game
    computer_turn
  end

  def computer_vs_computer
    @game = Game.new(Computer.new(@computer1, "X"), Computer.new(@computer2, "O"), BoardBuilder.new(@board_size))
    create_new_game
  end

  #starts the game in game class
  def create_new_game
    @game.new_game
  end

# #players input that's invoked in game_loop
#   def player_turn
#     player_turn_output
#     NewGame.display_board(@board_size)
#     PlayerInput.get_move(@game)
    # loop do
    #   input = gets.strip
    #   if input_is_an_integer?(input)
    #     index = input.to_i
    #     if !valid_move?(index)
    #       puts "That's a no-no. Try again."
    #     else
    #       @game.play(index)
    #       display_board
    #       break
    #     end
    #   else
    #     puts "Hmm you entered something I do not recognize."
    #   end
    # end
  # end

# #computers input that's invoked in game_loop
#   def computer_turn
#     puts "#{@game.current_player.name} is thinking..."
#     @game.play(@game.current_player.play(@game))
#     display_board
#   end
#
# #Tells us which player's turn it is
#   def player_turn_output
#     puts "#{@game.current_player.name}, make your move: "
#   end

# #when game_loop exits game.game_over?
#   def end_of_game(player1, player2)
#     @game.update_game_status(player1, player2)
#     puts @border
#     @game.winner ? message = "#{@game.winner.name} is the winner!" : message = "Look at that! It's a draw!"
#     puts message
#     puts @border
#   end
#
#     private
#
#
#
#
#
#
# #Sign off for game exit
#   trap "SIGINT" do
#     puts " Go To Bed ZZZzz"
#     exit 130
#   end
end
