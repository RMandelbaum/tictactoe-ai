require 'computer'

describe Computer do
  subject(:computer) { described_class.new("Bob the Computer", "O")}
  let(:player1) { Player.new("X") }
  let(:board) { Board.new }
  let(:game) { Game.new(player1, computer, board)}


  context "#initialize" do

    it "takes a name when initialized" do
      expect(computer.name).to eq "Bob the Computer"
    end
    it "takes a symbol when initialized" do
      expect(computer.symbol).to eq "O"
    end
  end
  
end
