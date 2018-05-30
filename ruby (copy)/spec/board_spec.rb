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

  context "#move" do
    it "allows the user to set symbol in any empty space" do
      board.move(0, "X", "O")
      expect(board.spaces).to eq(["X",1,2,3,4,5,6,7,8])
    end

    it "does not allow the user to place their symbol in a taken space" do
      board.move(0, "X", "O")
      expect(board.move(0, "O", "X")).to eq false
    end

    it "does not allow the user to place their symbol in a space greater than 8" do
      expect(board.move(9, "X", "O")).to eq false
    end

    it "does not allow the user to place their symbol in a space below 0" do
      expect(board.move(-1, "O", "X")).to eq false
    end
  end


  context "#winning_combos" do
    it "sees all the winning options" do
      expect(board.winning_combos).to eq [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    end
  end

  context "#draw?" do
    it "checks if there are no more moves" do
      draw_game
      expect(board.draw?("X", "O")).to eq true
    end
  end

  context "#game_over?" do
    it "sets the game to over if it is a draw" do
      draw_game
      expect(board.game_over?("X", "O")).to eq true
    end
  end
end
