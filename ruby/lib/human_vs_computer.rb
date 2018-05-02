module HumanVsComputer

#Main method that invokes this version
  def human_vs_computer
    get_single_player
    display_board
  end

#Get's user input for name and symbol
def get_single_player
  puts "Player 1, enter Name"
  name = gets.strip
  get_first_symbol
  @computer_symbol = "O"
  #Insert validation so player doesn't choose O
  puts "#{name} vs Bob the Computer"
end


def h_vs_c_turn_count
counter = 0
@board.each do|space|
  if space == @first_symbol || space == @computer_symbol
    counter +=1
  end
end
  counter
end

#Figures out which player's turns
#Return Value goes to move method so input is correct
def h_vs_c_current_player
  turn_count.odd? ? @computer_symbol : @first_symbol
end

#Method depends on current player - human vs computer
def h_vs_c_turn
  if current_player == @first_symbol
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
       move(index, current_player)
       display_board
     elsif (index > 8 || index < 0)
       puts "Invalid Number Bruh"
       h_vs_c_turn
     else
       puts "Space is taken"
       h_vs_c_turn
     end
   else
     computer_move(board)
     display_board
   end
end

#use minmax algorithm to figure out best best_move
#Make it unbeatable
def computer_move(board)
  puts "Hello we made it this far"
  binding.pry
  # ui.thinking(piece)
  minmax(board, piece)
  board.place_piece(best_choice, piece)
end

def minmax(board, current_player)
  return score(board) if game_over?(board)

  scores = {}

  board.available_spaces.each do |space|
    # Copy board so we don't mess up original
    potential_board = board.dup
    potential_board.place_piece(space, current_player)

    scores[space] = minmax(potential_board, switch(current_player))
  end

  @best_choice, best_score = best_move(current_player, scores)
  best_score
end

def best_move(piece, scores)
  if piece == @piece
    scores.max_by { |_k, v| v }
  else
    scores.min_by { |_k, v| v }
  end
end

def score(board)
  if board.winner == piece
    return 10
  elsif board.winner == @opponent
    return -10
  end
  0
end

def h_vs_c_winner
  if won?
    winner_symbol = @board[won?[0]]
  end
  if winner_symbol == @first_symbol
    @name
  else
    "Bob the Computer"
  end
end

end
