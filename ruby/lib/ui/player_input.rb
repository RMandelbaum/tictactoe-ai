#handles player inputs and ui for game process turns
class PlayerInput

  def initialize
  end

  def get_move(game)
    loop do
      input = gets.strip
      if input_is_an_integer?(input)
        index = input.to_i - 1
        if !valid_move?(game, index)
          puts "That's a no-no. Try again."
        else
          game.play(index)
          break
        end
      else
        puts "Hmm you entered something I do not recognize."
      end
    end

end

#players input that's invoked in game_loop
  def player_turn(game)
    BoardBuilder.build_board(game.board)
    player_turn_output(game)
    get_move(game)
  end

#computers input that's invoked in game_loop
  def self.computer_turn(game)
    puts "#{game.current_player.name} is thinking..."
  end

#Tells us which player's turn it is
  def player_turn_output(game)
    puts "#{game.current_player.name}, make your move: "
  end

  def end_of_game(game)
    game.winner ? message = "#{game.winner} is the winner!" : message = "Look at that! It's a draw!"
    BoardBuilder.build_board(game.board)
    puts message
  end


private

#Validations for users input
  def input_is_an_integer?(input)
    /\A[+-]?\d+\z/ === input
  end

  def position_taken? (game, space)
    if (game.board.spaces[space] == game.player1.symbol) || (game.board.spaces[space] == game.player2.symbol)
      true
    end
  end

  def valid_move?(game, index)
    !position_taken?(game, index) && index.between?(0, game.board.spaces.count)
  end

#Sign off for game exit
  trap "SIGINT" do
    puts " Go To Bed ZZZzz"
    exit 130
  end

end
