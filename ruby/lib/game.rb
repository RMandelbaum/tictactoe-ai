require_relative 'human_vs_human.rb'
require_relative 'human_vs_computer.rb'
require_relative 'computer_vs_computer.rb'

class TicTacToe
  include HumanVsHuman
  include HumanVsComputer
  include ComputerVsComputer

  def initialize(board = ["1","2","3","4","5","6","7","8","9"])
    @board = board
  end

  def board
    @board
  end

  def board= (board)
    @board = board
  end


  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,4,8], #diagonal 1
    [2,4,6], #diagonal 2
    [0,3,6], #vertical 1
    [1,4,7], #vertical 2
    [2,5,8] #vertical 3
  ]

##Method to select what type of game will be played (Requirement)
##Invokes the modules of various games
  def new_game
    puts "Welcome to Tic Tac Toe!"
    puts "To begin enter a number to select type of game"
    puts "1- Human vs Human"
    puts "2- Human vs Computer"
    puts "3- Computer vs Computer"
    input = gets.strip
    if input.to_i == 1
      human_vs_human
      @current_game = "h_vs_h"
    elsif input.to_i == 2
      human_vs_computer
      @current_game = "h_vs_c"
    elsif input.to_i == 3
      computer_vs_computer
      @current_game = "h_vs_c"
    else
      puts "Invalid Number"
      new_game
    end
  end

  def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    make_int = user_input.to_i
    number = make_int-1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken? (index)
    if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
    false
  # else (@board[index] == "X") || (@board[index] == "O")
  #   true
  end
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end



  # def turn
  #   puts "Please enter 1-9:"
  #   input = gets.strip
  #   index = input_to_index(input)
  #   if valid_move?(index)
  #     move(index, current_player)
  #     display_board
  #   elsif (index > 8 || index < 0)
  #     puts "Invalid Number Bruh"
  #     turn
  #   else
  #     puts "Space is taken"
  #     turn
  #   end
  # end

  # def turn_count
  # counter = 0
  # @board.each do|space|
  #   if space == "X" || space == "O"
  #     counter +=1
  #   end
  # end
  #   counter
  # end

  # def current_player
  #   turn_count.odd? ? "O" : "X"
  # end

  def won?()
    WIN_COMBINATIONS.detect do |combination| # combination on the first loop will equal [0,1,2], which is an array of index values
      @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]] && @board[combination[0]] != " "
    end
  end

  def full?()
    # google all? array iterator
    @board.all? do|occupied|
      (occupied == "X" || occupied =="O") && (occupied != " ")
    end
  end

  def draw?
    if full? && ! won?
      true
    end
  end

  def over?
    if won? || full? || draw?
      true
    end
  end

  # def winner
  #   if won?
  #     winner_symbol = @board[won?[0]]
  #   end
  #   if winner_symbol == @first_symbol
  #     @name1
  #   else
  #     @name2
  #   end
  # end

  def play
      new_game
      while !over?
        if @current_game == "h_vs_h"
             h_vs_h_turn
         elsif @current_game == "h_vs_c"
            h_vs_c_turn
         else
           puts "We're not there yet "
        #   c_c_turn
         end
    end

      if won?
        puts "#{winner} Won!"
      end
      if draw?
        puts "It's a Draw!"
      end
    end


end
