defmodule GameOver do
  def init(gamestate) do
    GameOver.check_for_win_or_tie(gamestate)
    GameOver.game_end
  end

  def check_for_win_or_tie(gamestate) do
    if Game.is_over?(gamestate.board) do
      cond do
       Game.has_win?(gamestate.board) ->
         announce_if_human_player_won_or_lost(gamestate)
       Game.is_tied?(gamestate.board) ->
         IO.puts CliMessages.game_tied
      end
    end
  end

  defp announce_if_human_player_won_or_lost(gamestate) do
    icon = Game.winning_icon(gamestate.board)
    if gamestate.player1.icon == icon do
      IO.puts "\n" <> gamestate.player1.name <> " wins!\n"
    else
      IO.puts "\n" <> gamestate.player2.name <> " wins!\n"
    end
  end

  def game_end do
    IO.puts CliMessages.game_end
  end

end
