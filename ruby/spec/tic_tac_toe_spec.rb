
describe TicTacToe do
  subject(:tic_tac_toe) { described_class.new }
  let(:player1) { Player.new("Bob", "X") }
  let(:player2) { Player.new("Sally", "O") }
  let(:game) { Game.new(player1, player2, board)}

  context "#select_game_type" do
    it "responds when there is an invalid number" do
      allow(tic_tac_toe).to receive(:gets).and_return('42')
      allow(tic_tac_toe).to receive(:loop).and_yield
      expect { tic_tac_toe.select_game_type }.to output("Hmm you entered something I do not recognize. - 1, 2 or 3\n").to_stdout
    end

    it "invokes 1 - Two players" do
      allow(tic_tac_toe).to receive(:gets).and_return('1')
      allow(tic_tac_toe).to receive(:two_player_game)
    end

    it "invokes 2 - Player vs Computer" do
      allow(tic_tac_toe).to receive(:gets).and_return('2')
      allow(tic_tac_toe).to receive(:play_order_prompt)
    end

    it "invokes 3 - Computer vs Computer" do
      allow(tic_tac_toe).to receive(:gets).and_return('3')
      allow(tic_tac_toe).to receive(:computer_vs_computer)
    end
  end

  context "#two_player_game" do
    it "creates a game with two players" do
      allow(tic_tac_toe).to receive(:play_order_prompt)
      tic_tac_toe.two_player_game
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Player)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Player)
    end
  end

  context "#player_vs_computer" do
    it "creates a game with player vs computer" do
      allow(tic_tac_toe).to receive(:play_order_prompt)
      tic_tac_toe.player_vs_computer_player_first
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Player)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Computer)
    end
  end

  context "#computer_vs_computer" do
    it "creates a game with computer vs computer" do
      allow(tic_tac_toe).to receive(:play_order_prompt)
      tic_tac_toe.computer_vs_computer
      expect(tic_tac_toe.game.player1).to be_a_kind_of(Computer)
      expect(tic_tac_toe.game.player2).to be_a_kind_of(Computer)
    end
  end

  context "#play_order" do
    it "handles an invalid selection" do
      allow(tic_tac_toe).to receive(:gets).and_return('hello')
      allow(tic_tac_toe).to receive(:loop).and_yield
      expect { tic_tac_toe.play_order }.to output("Hmm you entered something I do not recognize. 1 or 2?\n").to_stdout
    end

    it "handles a player" do
      allow(tic_tac_toe).to receive(:gets).and_return('1')
      allow(tic_tac_toe).to receive(:create_new_game)
      allow(tic_tac_toe).to receive(:player_vs_computer_player_first)
    end

    it "handles a computer" do
      allow(tic_tac_toe).to receive(:gets).and_return('2')
      allow(tic_tac_toe).to receive(:create_new_game)
      allow(tic_tac_toe).to receive(:player_vs_computer_computer_first)
    end
  end

 end
