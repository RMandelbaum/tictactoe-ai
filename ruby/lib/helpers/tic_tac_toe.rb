def player_vs_player
  @player1 = @new_game.get_first_player
  @player2 = @new_game.get_second_player
  @first_symbol = @new_game.get_first_symbol
  @second_symbol = @new_game.get_second_symbol
  board_type = @new_game.get_board_type
  @board_size = board_type.board_size
  two_player_game
end

def player_vs_computer
  @player1 = @new_game.get_one_player
  @first_symbol = @new_game.get_first_symbol
  board_type = @new_game.get_board_type
  @board_size = board_type.board_size
  @computer1 = "Bob the Computer (-_(-_(-_(-_-)_-)_-)_-) "
  @computer1_symbol = @new_game.set_computers_symbol
  @new_game.play_order_prompt
  @play_order = @new_game.play_order
  if @play_order == 1
    player_vs_computer_player_first
  else
    player_vs_computer_computer_first
    PlayerInput.computer_turn(game)
  end
end

def computer_vs_computer
  @new_game.computer_turn_prompt
  computer1_vs_computer2
end
