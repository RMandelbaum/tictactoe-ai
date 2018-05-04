require 'computer'

describe Computer do
  subject(:computer) { described_class.new("O")}
  let(:player1) { Player.new("X") }
  let(:board) { Board.new }
  let(:game) { Game.new(player1, computer, board)}


  context "#initialize" do
    it "takes a marker when initialized" do
      expect(computer.marker).to eq "O"
    end
  end

  context "feature testing - warning SLOW" do
    it "player can start" do
      game.new_game
      game.play(0)
      game.play(computer.play(game))
      expect(game.show_board).not_to eq ["X",1,2,3,4,5,6,7,9]
    end

    it "computer can start" do
      game.new_game
      game.play(computer.play(game))
      game.play(2)
      expect(game.show_board).not_to eq [0,1,"X",3,4,5,6,7,8]
    end
  end

  context "full game feature test - warning SLOW" do
    it "will play on it's turn" do
      game.new_game
      game.play(0)
      game.play(computer.play(game))
      expect(game.show_board).not_to eq ["X",1,2,3,4,5,6,7,8]
    end

    it "will win the game" do
      game.new_game
      game.play(8)
      game.play(0)
      game.play(5)
      game.play(2)
      game.play(7)
      game.play(computer.play(game))
      expect(game.show_board).to eq ["O", "O", "O", 3, 4, "X", 6, "X", "X"]
    end

    it "will keep player from winning" do
      game.new_game
      game.play(8)
      game.play(0)
      game.play(5)
      game.play(computer.play(game))
      expect(game.show_board).to eq ["O", 1, "O", 3, 4, "X", 6, 7, "X"]
    end
  end
end
