# Controls the Player

class Player

  attr_reader :symbol, :name

  #initialize with name and symbol of choice 
  def initialize(name, symbol)
    @symbol = symbol
    @name = name
  end

  def play(game, space)
    game.play(space)
  end
end
