require 'player'

describe Player do
  subject(:player1) { described_class.new("X")}
  let(:player2) { instance_double Player, marker: "O" }
  let(:board) { Board.new }
  let(:game) { Game.new(player1, player2, board)}

  context "#initialize" do
    it "takes a marker when initialized" do
      expect(player1.marker).to eq "X"
    end

    context "#play" do
      it "responds to method" do
        expect(player1).to respond_to(:play).with(2).arguments
      end

      it "plays in the specified space" do
        game.new_game
        player1.play(game, 0)
        expect(game.show_board[0]).to eq "X"
      end
    end
  end
end
