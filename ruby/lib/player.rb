# Controls the Player

class Player

  attr_reader :symbol, :name

  #initialize with name and symbol of choice
  def initialize(name, symbol)
    @name = name
    @symbol = symbol

  end

  def play(game, index)
    game.play(index)
  end
end
