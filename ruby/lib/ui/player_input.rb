#player moves and ui for game process turns


class PlayerInput

def self.get_move(game)
  #@game = game
  loop do
    input = gets.strip
    if input_is_an_integer?(input)
      index = input.to_i - 1
      if !valid_move?(game, index)
        puts "That's a no-no. Try again."
      else
        game.play(index)
        #BoardBuilder.build_board(game.board)
        break
      end
    else
      puts "Hmm you entered something I do not recognize."
    end
  end

end


#players input that's invoked in game_loop
  def self.player_turn(game)
    BoardBuilder.build_board(game.board)
    player_turn_output(game)
    get_move(game)

  end
#computers input that's invoked in game_loop
  def self.computer_turn
    puts "#{@game.current_player.name} is thinking..."
    @game.play(@game.current_player.play(@game))
    display_board
  end

#Tells us which player's turn it is
  def self.player_turn_output(game)

    puts "#{game.current_player.name}, make your move: "
  end

  def self.end_of_game(game)
    # Game.update_game_status(player1, player2)
    #puts NewGame.border
    game.winner ? message = "#{game.winner} is the winner!" : message = "Look at that! It's a draw!"
    puts message
    #puts @border
  end


private

def self.input_is_an_integer?(input)
  /\A[+-]?\d+\z/ === input
end

#Validates position for two player game
def self.position_taken? (game, space)
  if (game.board.spaces[space] == game.player1.symbol) || (game.board.spaces[space] == game.player2.symbol)
    true
  end
end

def self.valid_move?(game, index)
  !position_taken?(game, index) && index.between?(0, game.board.spaces.count)
end

#Sign off for game exit
  trap "SIGINT" do
    puts " Go To Bed ZZZzz"
    exit 130
  end

end
