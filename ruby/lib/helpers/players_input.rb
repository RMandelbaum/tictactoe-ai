#Get Players Input and sets variables

  #player vs player
  def get_two_players
    puts "Player 1, enter name: "
    @player1 = gets.strip.upcase
    get_first_symbol

    puts "Player 2, enter name: "
    @player2 = gets.strip.upcase

    get_second_symbol
    puts "#{@player1} VS #{@player2}"
  end

  #Allow player2 to choose symbol
  def get_second_symbol
    puts "#{@player2} Select your symbol [One Character Valid]"
    @second_symbol = gets.strip

    #validates symbol length and unique symbol
    if @second_symbol.length != 1 || @second_symbol == @first_symbol || @second_symbol.is_a?(Integer)
      puts "Invalid. Let's try again."
      get_second_symbol
    end
  end

  #player vs player and player vs computer
  def get_one_player
    puts "Player - Enter your name: "
    @player1 = gets.strip
    @computer1 = "Bob the Computer (-_(-_(-_(-_-)_-)_-)_-) "
    get_first_symbol

  end


  #Allows user to select their symbol. Traditionally 'X' or 'O', but we'll allow them to choose.
  def get_first_symbol
    puts "#{@player1} Select your symbol [One Character Valid]"
    @first_symbol = gets.strip

    #validates symbol length
    if @first_symbol.length != 1
      puts "Only one Character. Try again."
      get_first_symbol
    elsif @first_symbol.is_a?(Integer)
      puts "Can't be an integer"#
      get_first_symbol
    end

    #validates that computer and player don't have the same symbol
    if @first_symbol == "O"
      @computer1_symbol = "X"
    else
      @computer1_symbol = "O"
     end
end
