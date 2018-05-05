
describe Player do
  subject(:player1) { described_class.new(:name1, :symbol)}
  let(:player2) { instance_double Player, symbol: "O" }
  let(:board) { Board.new }
  let(:game) { Game.new(player1, player2, board)}

  context "#initialize" do
    it "takes a symbol when initialized" do
      expect(player1.symbol).to eq (:symbol)
    end

    it "takes a name when initialized" do
      expect(player1.name).to eq (:name1)
    end

    context "#play" do
      it "method is invoked" do
        expect(player1).to respond_to(:play).with(2).arguments
      end

      it "plays in the specified space" do
        game.new_game
        player1.play(game, 0)
        expect(game.show_board[0]).to eq (:symbol)
      end
    end
  end
end
