
module HumanVsHuman

  #Main method that invokes this version
  def human_vs_human
    get_players
    display_board
  end

  #get players names and input
  def get_players
    puts "Player 1, enter Name"
    @name1 = gets.strip.upcase
    get_first_symbol

    puts "Player 2, enter Name"
    @name2 = gets.strip.upcase
    get_second_symbol
    puts "#{@name1} VS #{@name2}"
  end



#Allows user to select their symbol. Traditionally 'X' or 'O', but we'll allow them to choose.
  def get_first_symbol
    puts "#{@name1} Select your symbol [One Character Valid]"
    @first_symbol = gets.strip
    #validates symbol length
    if @first_symbol.length != 1
      puts "Invalid"
      get_first_symbol
    end
    # end
end

#Allow to choose symbol
def get_second_symbol
  puts "#{@name2} Select your symbol [One Character Valid]"
  @second_symbol = gets.strip

  #validates symbol length and unique symbol
  if @second_symbol.length != 1 || @second_symbol == @first_symbol
    puts "Invalid"
    get_second_symbol
  end
end

#Counts the amount of turns in the game
def turn_count
counter = 0
@board.each do|space|
  if space == @first_symbol || space == @second_symbol
    counter +=1
  end
end
  counter
end

#Figures out which player's turns
#Return Value goes to move method so input is correct
def current_player
  turn_count.odd? ? @second_symbol : @first_symbol
end


  def h_vs_h_turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    elsif (index > 8 || index < 0)
      puts "Invalid Number Bruh"
      h_vs_h_turn
    else
      puts "Space is taken"
      h_vs_h_turn
    end
  end

  def winner
    if won?
      winner_symbol = @board[won?[0]]
    end
    if winner_symbol == @first_symbol
      @name1
    else
      @name2
    end
  end


end
