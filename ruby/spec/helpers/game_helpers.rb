def x_wins_two_player
  game.new_game
  game.play(0)
  game.play(6)
  game.play(1)
  game.play(7)
  game.play(2)
end

def o_wins_two_player
  game.new_game
  game.play(0)
  game.play(2)
  game.play(1)
  game.play(4)
  game.play(8)
  game.play(6)
end

def tied_game_two_player
  game.new_game
  game.play(0)
  game.play(8)
  game.play(4)
  game.play(6)
  game.play(7)
  game.play(1)
  game.play(2)
  game.play(3)
  game.play(5)
end
