require 'tic_tac_toe'
require 'stringio'

describe TicTacToe do
  subject(:tic_tac_toe) { described_class.new }
  let(:player1) { Player.new("X") }
  let(:player2) { Player.new("O") }
  let(:game) { Game.new(player1, player2, board)}

  context "#select_game_type" do
    it "responds when there is an invalid number" do
      allow(tic_tac_toe).to receive(:gets).and_return('42')
      allow(tic_tac_toe).to receive(:loop).and_yield
      expect { tic_tac_toe.select_game_type }.to output("I didn't quite get that - 1, 2 or 3\n").to_stdout
    end

    it "handles 1 - Two players" do
      allow(tic_tac_toe).to receive(:gets).and_return('1')
      allow(tic_tac_toe).to receive(:two_player_game)
      expect { tic_tac_toe.select_game_type }.to output("Two players? Great choice\n").to_stdout
    end

    it "handles 2 - Player vs Computer" do
      allow(tic_tac_toe).to receive(:gets).and_return('2')
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      expect { tic_tac_toe.select_game_type }.to output("Against the computer? You won't win!\n").to_stdout
    end

    it "handles 3 - Computer vs Computer" do
      allow(tic_tac_toe).to receive(:gets).and_return('3')
      allow(tic_tac_toe).to receive(:computer_vs_computer)
      expect { tic_tac_toe.select_game_type }.to output("Watching two computers battle it out? Nice!\n").to_stdout
    end
  end

  context "#two_player_game" do
    it "creates a game with two players" do
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      tic_tac_toe.two_player_game
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Player)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Player)
    end
  end

  context "#player_vs_computer" do
    it "creates a game with a player and a computer" do
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      tic_tac_toe.player_vs_computer_player_first
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Player)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Computer)
    end
  end

  context "#computer_vs_computer" do
    it "creates a game with two computers" do
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      tic_tac_toe.computer_vs_computer
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Computer)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Computer)
    end
  end

  context "#who_goes_first" do
    it "hanles an invalid selection" do
      allow(tic_tac_toe).to receive(:gets).and_return('hello')
      allow(tic_tac_toe).to receive(:loop).and_yield
      expect { tic_tac_toe.who_goes_first }.to output("I didn't quite get that - 1 or 2?\n").to_stdout
    end

    it "handles a player" do
      allow(tic_tac_toe).to receive(:gets).and_return('1')
      allow(tic_tac_toe).to receive(:create_new_game)
      allow(tic_tac_toe).to receive(:player_vs_computer_player_first)
      expect { tic_tac_toe.who_goes_first }.to output("You go first!\n").to_stdout
    end

    it "handles a computer" do
      allow(tic_tac_toe).to receive(:gets).and_return('2')
      allow(tic_tac_toe).to receive(:create_new_game)
      allow(tic_tac_toe).to receive(:player_vs_computer_computer_first)
      expect { tic_tac_toe.who_goes_first }.to output("The computer goes first!\n").to_stdout
    end
  end


  context "#player_turn" do
    it "handles invalid text" do
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      tic_tac_toe.two_player_game
      tic_tac_toe.game.new_game
      allow(tic_tac_toe).to receive(:loop).and_yield
      allow(tic_tac_toe).to receive(:player_turn_output)
      allow(tic_tac_toe).to receive(:gets).and_return('hello')
      expect { tic_tac_toe.player_turn }.to output("Not a number. Try again!\n").to_stdout
    end

    it "handles a valid cell" do
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      tic_tac_toe.two_player_game
      tic_tac_toe.game.new_game
      allow(tic_tac_toe).to receive(:loop).and_yield
      allow(tic_tac_toe).to receive(:player_turn_output)
      allow(tic_tac_toe).to receive(:gets).and_return('0')
      expect { tic_tac_toe.player_turn }.to output("     X | 1 | 2\n   -------------\n     3 | 4 | 5\n   -------------\n     6 | 7 | 8\n").to_stdout
    end

    it "handles a taken cell" do
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      tic_tac_toe.two_player_game
      tic_tac_toe.game.new_game
      tic_tac_toe.game.play(0)
      allow(tic_tac_toe).to receive(:loop).and_yield
      allow(tic_tac_toe).to receive(:player_turn_output)
      allow(tic_tac_toe).to receive(:gets).and_return('0')
      expect { tic_tac_toe.player_turn }.to output("You can't go there. Try again!\n").to_stdout
    end
  end

  context "#end_of_game" do
    it "shows the winner when there is one" do
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      tic_tac_toe.two_player_game
      tic_tac_toe.game.new_game
      tic_tac_toe.game.play(0)
      tic_tac_toe.game.play(6)
      tic_tac_toe.game.play(1)
      tic_tac_toe.game.play(7)
      tic_tac_toe.game.play(2)
      expect { tic_tac_toe.end_of_game }.to output("============================\nX is the winner!\n============================\n").to_stdout
    end

    it "alerts the user when there is a tie" do
      allow(tic_tac_toe).to receive(:who_goes_first_prompt)
      tic_tac_toe.two_player_game
      tic_tac_toe.game.new_game
      tic_tac_toe.game.play(0)
      tic_tac_toe.game.play(8)
      tic_tac_toe.game.play(4)
      tic_tac_toe.game.play(6)
      tic_tac_toe.game.play(7)
      tic_tac_toe.game.play(1)
      tic_tac_toe.game.play(2)
      tic_tac_toe.game.play(3)
      tic_tac_toe.game.play(5)
      expect { tic_tac_toe.end_of_game }.to output("============================\nThe game was tied!\n============================\n").to_stdout
    end
  end
end
