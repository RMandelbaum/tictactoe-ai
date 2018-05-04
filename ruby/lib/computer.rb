# Controls the AI
class Computer

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def play(game)
    calculate_best_move(game)
  end

  private

  def calculate_best_move(game, depth = 0, best_score = {})
    return score_scenarios(game) if game.game_over?

    game.board.all_available_spaces.each do |space|
      game.play(space)
      best_score[space] = calculate_best_move(game, depth += 1, {})
      reset_space(game, space)
    end

    return best_space_to_pick(best_score) if depth == game.board.all_available_spaces.length
    game.current_player.marker == @marker ? top_minimax_score(best_score) : alternatave_score(best_score)
  end

  def score_scenarios(game)
    @marker == "X" ? opponent = "O" : opponent = "X"
    return -1 if game.board.game_won?(opponent)
    return 1 if game.board.game_won?(@marker)
    return 0 if game.board.tied?
  end

  def reset_space(game, space)
    game.board.reset_space(space)
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
