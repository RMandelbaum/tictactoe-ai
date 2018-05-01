
module HumanVsHuman

##Allow user to enter name and invokes select_symbol method
  def human_vs_human
    puts "Player 1, enter Name"
    @name1 = gets.strip.upcase
    select_symbol

    puts "Player 2, enter Name"
    @name2 = gets.strip.upcase
    puts "#{@name1} VS #{@name2}"
    display_board
  end

#Allows user to select their symbol. Traditionally 'X' or 'O', but we'll allow them to choose.
  def select_symbol
    puts "#{@name1} Select your symbol: 'X' or 'O'"
    symbol_input = gets.strip.upcase
    ###Validation not working for input ???????
    # if symbol_input != 'X' || symbol_input != 'O'
    #   puts "Invalid Entry"
    #   select_symbol
    # end
    # if @symbol_input == "X" ? @name1 = player_one : @name2 = player_two
  # end
end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    elsif (index > 8 || index < 0)
      puts "Invalid Number Bruh"
      turn
    else
      puts "Space is taken"
      turn
    end
  end

end
