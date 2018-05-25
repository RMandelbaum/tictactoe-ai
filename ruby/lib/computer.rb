# Controls the AI figure out how to make it way more unbeatable
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
    return score_scenarios(game) if game.game_over?(game.player1.symbol, game.player2.symbol)
    check_spaces = game.board.spaces.select {|space| space.is_a?(Integer) }
    check_spaces.each do |space|
      game.play(space)
      best_score[space] = calculate_best_move(game, depth += 1, {})
      reset_space(game, space)
    end

    return best_space_to_pick(best_score) if depth == check_spaces.length
    game.current_player.symbol == @symbol ? top_minimax_score(best_score) : alternatave_score(best_score)
  end


  def score_scenarios(game)
    @symbol == game.player1.symbol ? opponent = game.player2.symbol : opponent = game.player1.symbol
    return -1 if game.board.game_won?(opponent)
    return 1 if game.board.game_won?(@symbol)
    return 0 if game.board.draw?(opponent, @symbol)
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
#
# class AI
#   attr_accessor :grid, :token, :checker, :script
#
#   def initialize(board, checker, token, min_token)
#     @board = board
#     @checker = checker
#     @token = token
#     @min_token = min_token
#   end
#
#   def get_move(message, turns_remaining)
#     depth = [turns_remaining, 9].min
#     minimax(depth, -Float::INFINITY, Float::INFINITY, true)[1] + 1
#   end
#
#   def minimax(depth, alpha, beta, maximizingPlayer)
#     @checker.clear_winner
#     bestScore = 0
#     bestMove = -1
#
#     if(depth == 0 || @checker.game_over?(depth))
#       bestScore = score(@checker.winner, depth)
#       return [bestScore, bestMove]
#     end
#
#     for i in 0...@board.size**2
#       if (@board.grid[i] == @board.empty_char)
#         @board.grid[i] = maximizingPlayer ? @token : @min_token
#         bestScore, move = minimax(depth - 1, alpha, beta, !maximizingPlayer)
#
#         if(maximizingPlayer)
#           if(alpha < bestScore)
#             alpha = bestScore
#             bestMove = i
#           end
#         end
#
#         if(!maximizingPlayer)
#           if(beta > bestScore)
#             beta = bestScore
#             bestMove = i
#           end
#         end
#
#         @board.grid[i] = '-'
#
#         if (alpha >= beta)
#           break
#         end
#       end
#     end
#
#     bestScore = maximizingPlayer ? alpha : beta
#
#     [bestScore, bestMove]
#   end
#
#   def score(winner, depth)
#     if(winner == @token)
#      return 10 + depth
#     elsif(winner == @min_token)
#       return -10 - depth
#     else
#       return 0
#     end
#   end
# end
