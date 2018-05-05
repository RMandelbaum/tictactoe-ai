
def draw_game
  board.move(0,"X", "O")
  board.move(8, "O", "X")
  board.move(4, "X", "O")
  board.move(6, "O", "X")
  board.move(7, "X", "O")
  board.move(1, "O", "X")
  board.move(2, "X", "O")
  board.move(3, "O", "X")
  board.move(5, "X", "O")
end
