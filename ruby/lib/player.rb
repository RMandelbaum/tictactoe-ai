# Controls the Player creation

class Player

  attr_reader :symbol, :name

  #initialize with name and symbol of choice
  def initialize(name, symbol)
    @name = name
    @symbol = symbol

  end

  #Shouldn't be here, should go in the game logic

  # def play(game, index)
  #   game.play(index)
  # end
end
