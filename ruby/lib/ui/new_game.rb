#sets up board type and game type
# Gets player names and symbols

class NewGame

#Initial Welcome to begin game
  def self.welcome
    @border = "~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts @border
    puts "Welcome to Tic Tac Toe!"
    puts @border
  end


  # #shows board as game plays
     def self.display_board(board)
       BoardBuilder.build_board(board)
     end


  def self.get_board_type
    puts "Enter any number to build your board size: "
    input = gets.strip
    number = input.to_i
     #validate input to be a number
    if input_is_an_integer?(number)
      byebug
      puts "Please Enter a Valid Number: "
      get_board_type
    else
    BoardBuilder.new(number)
  end
  end

  #Options to select game types [3]
    def self.get_game_type
      puts "To begin enter a number to select type of game:"
      puts " -1- Two Player Game"
      puts " -2- Player vs Computer"
      puts " -3- Computer vs Computer"
      @game_type = gets.strip.to_i
      @game_type
    end

    #asks for play order
  def self.play_order_prompt
    @computer1 = "Bob the Computer (-_(-_(-_(-_-)_-)_-)_-) "

    puts "Choose who goes first: "
    puts " -1- #{@player1}"
    puts " -2- #{@computer1}"
    play_order
      end

    #play order for player_vs_computer
      def self.play_order
        loop do
          starting_player = gets.strip.to_i
          case starting_player
          when 1
            puts "Start us up, #{@player1}!"
            set_computers_symbol
            break
          when 2
            puts "Start us up, #{@computer1}!"
            @computer1_symbol = "X"
            break
          else
            puts "Hmm you entered something I do not recognize. 1 or 2?"
          end
        end
      end

      #Get Players Input and sets variables
      def self.get_first_player
        puts "Player 1, enter name: "
        @player1 = gets.strip.upcase
        # get_first_symbol
        @player1
      end

      def self.get_second_player
        puts "Player 2, enter name: "
        @player2 = gets.strip.upcase
        # get_second_symbol
        puts "#{@player1} VS #{@player2}"
        @player2
      end

        #Allow player2 to choose symbol
        def self.get_second_symbol
          puts "#{@player2} Select your symbol [One Character Valid, No Numbers]"
          @second_symbol = gets.strip

          #validates symbol length and unique symbol
          if @second_symbol.length != 1 || @second_symbol == @first_symbol || input_is_an_integer?(@second_symbol)
            puts "Invalid. Let's try again."
            get_second_symbol
          end

          @second_symbol
        end

        #player vs player and player vs computer
        def self.get_one_player
          puts "Player - Enter your name: "
          @player1 = gets.strip
        end

        #Allows user to select their symbol. Traditionally 'X' or 'O', but we'll allow them to choose.
        def self.get_first_symbol
          puts "#{@player1} Select your symbol [One Character Valid, No Numbers]"
          @first_symbol = gets.strip

          #validates symbol length
          if @first_symbol.length != 1 || input_is_an_integer?(@first_symbol)
            puts "Invalid. Let's try again."
            get_first_symbol
          end
          @first_symbol
        end
          #validates that computer and player don't have the same symbol
        def self.set_computers_symbol
          if @first_symbol == "O"
            @computer1_symbol = "X"
          else
            @computer1_symbol = "O"
           end
        end

      #validates input is an integer or not an integer [we don't want symbols matching the board options]
        def self.input_is_an_integer?(input)
          /\A[+-]?\d+\z/ === input
        end
      #
      # #Validates position for two player game
      #   def position_taken? (space)
      #     if (@game.board.spaces[space] == @game.player1.symbol) || (@game.board.spaces[space] == @game.player2.symbol)
      #       true
      #     end
      #   end
      #
      #   def valid_move?(index)
      #     !position_taken?(index) && index.between?(0,8)
      #   end


end
