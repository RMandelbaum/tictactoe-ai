require 'board'
require_relative 'helpers/board_helpers'

describe Board do
  subject(:board) { described_class.new}

  context "#initialize" do
    it "initializes with an array numbered 0 - 8" do
      expect(board.spaces).to eq([0,1,2,3,4,5,6,7,8])
    end

    it "has no winner" do
      expect(board.winner).to eq nil
    end
  end

  context "#all_available_spaces" do
    it "checks all available spaces" do
      expect(board.all_available_spaces).to eq [0,1,2,3,4,5,6,7,8]
    end
  end

  context "#take_turn" do
    it "allows the user to place their marker in any empty space" do
      board.take_turn(0, "X")
      expect(board.spaces).to eq(["X",1,2,3,4,5,6,7,8])
    end

    it "does not allow the user to place their marker somewhere that has been taken" do
      board.take_turn(0, "X")
      expect(board.take_turn(0, "O")).to eq false
    end

    it "does not allow the user to place their marker somewhere that is not in the spaces array" do
      expect(board.take_turn(9, "X")).to eq false
    end

    it "does not allow the user to place their marker in a negative number" do
      expect(board.take_turn(-1, "O")).to eq false
    end
  end

  context "#check_winner" do

    it "knows when the winner of the game is X " do
      x_wins
      board.check_winner
      expect(board.winner).to eq "X"
    end

    it "knows when the winner of the game is O " do
      o_wins
      board.check_winner
      expect(board.winner).to eq "O"
    end
  end

  context "#all_winning_possibilities" do
    it "sees all the winning options" do
      expect(board.all_winning_possibilities).to eq [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    end
  end

  context "#tied?" do
    it "checks if there are no more moves" do
      tied_game
      expect(board.tied?).to eq true
    end
  end

  context "#game_over?" do
    it "sets the game to over if it is tied" do
      tied_game
      expect(board.game_over?).to eq true
    end
  end
end
