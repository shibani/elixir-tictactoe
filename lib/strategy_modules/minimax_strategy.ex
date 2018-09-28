defmodule MinimaxStrategy do
  def best_move(gamestate, depth \\ 0) do
    available_squares = Board.empty_squares(gamestate.board)

    if Game.is_over?(gamestate.board) do
      player_score_value(gamestate.board)
    else
      scores_map = Enum.map(available_squares, fn index -> { index, -1 * best_move(MinimaxStrategy.place_move(gamestate, index), depth + 1) } end)
                     |> Map.new()

      cond do
        depth == 0 ->
          highest_score(scores_map)
        depth > 0 ->
          best_score(scores_map)
      end
    end
  end

  def place_move(gamestate, square) do
    Game.mark_square(gamestate, square)
    |> GameState.switch_current_player
  end

  defp player_score_value(board) do
    if Game.has_win?(board), do: -1, else: 0
  end

  defp highest_score(scores_map) do
    scores_map
    |> Enum.find(fn {_move, score} -> (score == best_score(scores_map)) end)
    |> elem(0)
  end

  defp best_score(scores_map) do
    scores_map
    |> Map.values()
    |> Enum.max
  end

end

