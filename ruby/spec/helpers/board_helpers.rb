def x_wins
  board.take_turn(0,"X")
  board.take_turn(6, "O")
  board.take_turn(1, "X")
  board.take_turn(7, "O")
  board.take_turn(2, "X")
end

def o_wins
  board.take_turn(0,"X")
  board.take_turn(2, "O")
  board.take_turn(1, "X")
  board.take_turn(4, "O")
  board.take_turn(8, "X")
  board.take_turn(6, "O")
end

def tied_game
  board.take_turn(0,"X")
  board.take_turn(8, "O")
  board.take_turn(4, "X")
  board.take_turn(6, "O")
  board.take_turn(7, "X")
  board.take_turn(1, "O")
  board.take_turn(2, "X")
  board.take_turn(3, "O")
  board.take_turn(5, "X")
end
