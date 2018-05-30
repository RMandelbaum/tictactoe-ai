require 'game'
require 'board'
require 'player'
require 'computer'
require 'tic_tac_toe'
require_relative 'helpers/game_helpers'

describe Game do
  let(:player1) { instance_double Player, symbol: "X" }
  let(:player2) { instance_double Player, symbol: "O" }
  let(:board) { Board.new }
  subject(:game) { described_class.new(player1, player2, board)}

  context "#initialize" do
    it "takes two players and a board" do
      expect(game.player1).to eq player1
      expect(game.player2).to eq player2
      expect(game.board).to eq board
    end
  end

  context "#play" do
    it "allows the current player to make their move" do
      game.new_game
      game.play(0)
      expect(game.show_board).to eq ["X",1,2,3,4,5,6,7,8]
    end

    it "switches the current player once a valid move is made" do
      game.new_game
      game.play(0)
      expect(game.current_player).to eq player2
    end

    it "does not switch the current player if their move was invalid" do
      game.new_game
      game.play(10)
      expect(game.current_player).to eq player1
    end

  end

  context "#end of game" do
    it "knows when X wins" do
      x_wins_two_player
      game.update_game_status(player1,player2)
      expect(game.winner).to eq board.winner
    end

    it "knows when O wins" do
      o_wins_two_player
      game.update_game_status(player1, player2)
      expect(game.winner).to eq board.winner
    end

    it "knows when the game is a draw" do
      draw_game_two_player
      game.update_game_status(player1, player2)
      expect(game.winner).to eq nil
    end
  end
end
