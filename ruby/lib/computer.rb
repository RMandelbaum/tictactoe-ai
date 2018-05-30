# Controls the AI logic
class Computer

  attr_reader  :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def play(game)
    calculate_best_move(game)
  end

  private

#min_max algorithm -- uses recursion
  def calculate_best_move(game, depth = 0, best_score = {})
    return score_scenarios(game) if game.game_over?
    #fix game.game_over?
    check_spaces = game.board.spaces.select {|space| space.is_a?(Integer) }
    check_spaces.each do |space|
      game.play(space)
      # errors out here ??????????
      best_score[space] = calculate_best_move(game, depth += 1, {})

      reset_space(game, space)
    end

    return best_space_to_pick(best_score) if depth == check_spaces.length
    game.current_player.symbol == @symbol ? top_minimax_score(best_score) : alternatave_score(best_score)
  end


  def score_scenarios(game)

    game.current_player == game.player2 ? opponent = game.player1.symbol : opponent = game.player2.symbol
    return -1 if game.winner == opponent
    return 1 if game.winner == game.current_player.symbol
    return 0 if game.draw?
  end

  def reset_space(game, space)
    game.reset_space(game,space)
    game.change_turns
  end

  def best_space_to_pick(best_score)
    best_score.max_by { |key, value| value }[0]
  end

  def top_minimax_score(best_score)
    best_score.max_by { |key, value| value }[1]
  end

  def alternatave_score(best_score)
    best_score.min_by { |key, value| value }[1]
  end

end
