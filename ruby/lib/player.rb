# Controls the Player and notes the marker

class Player

  attr_reader :symbol, :name

  def initialize(name, symbol)
    @symbol = symbol
    @name = name
  end

  def play(game, space)
    game.play(space)
  end
end
