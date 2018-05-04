require_relative 'game'
require_relative 'board'
require_relative 'player'
require_relative 'computer'
require_relative './helpers/players_input'

class TicTacToe

  attr_accessor :game

  def initialize
    @game = nil
    @border = "~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def game_loop
    welcome
    select_game_type
    until @game.game_over? do
      player_turn if @player1 || @player2

      computer_turn if @opponent == "Computer"
    end
    end_of_game
  end

  def end_of_game
    @game.update_game_status
    puts @border
    @game.winner ? message = "#{@game.winner} is the winner!" : message = "The game was tied!"
    puts message
    puts @border
  end

  def select_game_type
    loop do
      game_type = gets.strip.to_i
      case game_type
      when 1
        get_two_players
        two_player_game
        break
      when 2
        get_one_player
        play_order_prompt
        break
      when 3
        @player1 = "Bob the Computer [-/\-]"
        @player2 = "Sally the Machine [^()^]"
        puts "Check out these computers. Place your bets on #{@player1} vs #{@player2}!"

        computer_vs_computer
        break
      else
        puts "I didn't quite get that - 1, 2 or 3"
      end
    end
  end




  def two_player_game
    @game = Game.new(Player.new(@player1, @first_symbol), Player.new(@player2, @second_symbol), Board.new)
    create_new_game
  end

  def player_vs_computer_player_first
    @game = Game.new(Player.new(@symbol1), Computer.new("O"), Board.new)
    create_new_game
  end

  def player_vs_computer_computer_first
    @game = Game.new(Computer.new("X"), Player.new("O"), Board.new)
    create_new_game
    computer_turn
  end

  def computer_vs_computer
    @game = Game.new(Computer.new("X"), Computer.new("O"), Board.new)
    create_new_game
  end

  def choose_play_order
    loop do
      starting_player = gets.chomp.to_i
      case starting_player
      when 1
        puts "You go first!"
        player_vs_computer_player_first
        break
      when 2
        puts "The computer goes first!"
        player_vs_computer_computer_first
        break
      else
        puts "I didn't quite get that - 1 or 2?"
      end
    end
  end

  def player_turn
    player_turn_output
    display_board
    loop do
      space = gets.strip
      if input_is_an_integer?(space)
        space = space.to_i
        if !valid_move?(space)
          puts "You can't go there. Try again!"
        else
          @game.play(space)
          display_board
          break
        end
      else
        puts "Not a number. Try again!"
      end
    end
  end

  def play_order
    loop do
      starting_player = gets.strip.to_i
      case starting_player
      when 1
        puts "#{@player1} goes first!"
        player_vs_computer_player_first
        break
      when 2
        puts "#{@player2} goes first!"
        player_vs_computer_computer_first
        break
      else
        puts "I didn't quite get that - 1 or 2?"
      end
    end
  end

  private

    def welcome
      puts @border
      puts "Welcome to Tic Tac Toe!"
      puts @border
      display_empty_board
      puts @border
      puts "To begin enter a number to select type of game:"
      puts " -1- Two Player Game"
      puts " -2- Player vs Computer"
      puts " -3- Computer vs Computer"

    end

  def display_empty_board
    puts "     0 | 1 | 2"
    puts "   -------------"
    puts "     3 | 4 | 5"
    puts "   -------------"
    puts "     6 | 7 | 8"
  end

  def display_board
    puts "     #{@game.show_board[0]} | #{@game.show_board[1]} | #{@game.show_board[2]}"
    puts "   -------------"
    puts "     #{@game.show_board[3]} | #{@game.show_board[4]} | #{@game.show_board[5]}"
    puts "   -------------"
    puts "     #{@game.show_board[6]} | #{@game.show_board[7]} | #{@game.show_board[8]}"
  end


  def play_order_prompt
    puts "Choose who goes first: "
    puts " -1- #{@player1}"
    puts " -2- #{@player2}"
    play_order
  end

  def create_new_game
    @game.new_game
  end

  def input_is_an_integer?(input)
    /\A[+-]?\d+\z/ === input
  end

  def player_turn_output
    puts "#{@game.current_player.name}, which cell are you after?: "

  end


def position_taken? (space)
  if (@game.board.spaces[space] == @game.player1.symbol) || (@game.board.spaces[space] == @game.player2.symbol)
  true
# else (@board[index] == "X") || (@board[index] == "O")
#   true
end
end

def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end


  def computer_turn
    puts "Bob is thinking..."
    @game.play(@game.current_player.play(@game))
    show_board
  end


  trap "SIGINT" do
    puts " Go To Bed ZZZzz"
    exit 130
  end
end
