
  #get players players and input
  def get_two_players
    puts "Player 1, enter player"
    @player1 = gets.strip.upcase
    get_first_symbol

    puts "Player 2, enter player"
    @player2 = gets.strip.upcase
    get_second_symbol
    puts "#{@player1} VS #{@player2}"
  end



#Allows user to select their symbol. Traditionally 'X' or 'O', but we'll allow them to choose.
  def get_first_symbol
    puts "#{@player1} Select your symbol [One Character Valid]"
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
  puts "#{@player2} Select your symbol [One Character Valid]"
  @second_symbol = gets.strip

  #validates symbol length and unique symbol
  if @second_symbol.length != 1 || @second_symbol == @first_symbol
    puts "Invalid"
    get_second_symbol
  end
end

def get_one_player
  puts "Player - Enter your player: "
  @player1 = gets.strip
  puts "#{@player1}, choose your symbol: "
  @first_symbol = gets.strip
  get_first_symbol
  @player2 = "Bob the Computer (-_(-_(-_(-_-)_-)_-)_-) "
end
