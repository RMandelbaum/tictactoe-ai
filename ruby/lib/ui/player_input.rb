#player moves and ui for game process turns


class PlayerInput

def self.get_move(game)
  @game = game
  loop do
    input = gets.strip
    if input_is_an_integer?(input)
      index = input.to_i - 1
      if !valid_move?(index)
        puts "That's a no-no. Try again."
      else
        @game.play(index)
        BoardBuilder.build_board(3)
        byebug
        break
      end
    else
      puts "Hmm you entered something I do not recognize."
    end
  end

end


#players input that's invoked in game_loop
  def player_turn
    player_turn_output
    NewGame.display_board(@board_size)
    PlayerInput.get_move(@game)
  end
#computers input that's invoked in game_loop
  def computer_turn
    puts "#{@game.current_player.name} is thinking..."
    @game.play(@game.current_player.play(@game))
    display_board
  end

#Tells us which player's turn it is
  def player_turn_output
    puts "#{@game.current_player.name}, make your move: "
  end

  def end_of_game(player1, player2)
    @game.update_game_status(player1, player2)
    puts @border
    @game.winner ? message = "#{@game.winner.name} is the winner!" : message = "Look at that! It's a draw!"
    puts message
    puts @border
  end


private

def self.input_is_an_integer?(input)
  /\A[+-]?\d+\z/ === input
end

#Validates position for two player game
def self.position_taken? (space)

  if (@game.board.spaces[space] == @game.player1.symbol) || (@game.board.spaces[space] == @game.player2.symbol)
    true
  end
end

def self.valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end

#Sign off for game exit
  trap "SIGINT" do
    puts " Go To Bed ZZZzz"
    exit 130
  end

end
