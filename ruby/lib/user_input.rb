class UserInput

  def self.get_board_type
    puts "What type of board will you play?"
    input = gets.strip
    #validate input to be a number
    number = input.to_i
    number
  end

  #Options to select game types [3]
    def self.get_game_type
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



end
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
    puts "#{@player2} Select your symbol [One Character Valid, No Numbers]"
    @second_symbol = gets.strip

    #validates symbol length and unique symbol
    if @second_symbol.length != 1 || @second_symbol == @first_symbol || input_is_an_integer?(@second_symbol)
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
    puts "#{@player1} Select your symbol [One Character Valid, No Numbers]"
    @first_symbol = gets.strip

    #validates symbol length
    if @first_symbol.length != 1 || input_is_an_integer?(@first_symbol)
      puts "Invalid. Let's try again."
      get_first_symbol
    end
  end
    #validates that computer and player don't have the same symbol
  def set_computers_symbol
    if @first_symbol == "O"
      @computer1_symbol = "X"
    else
      @computer1_symbol = "O"
     end
  end

#validates input is an integer or not an integer [we don't want symbols matching the board options]
  def input_is_an_integer?(input)
    /\A[+-]?\d+\z/ === input
  end

#Validates position for two player game
  def position_taken? (space)
    if (@game.board.spaces[space] == @game.player1.symbol) || (@game.board.spaces[space] == @game.player2.symbol)
      true
    end
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
