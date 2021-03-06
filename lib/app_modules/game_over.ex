defmodule GameOver do
  def init(gamestate, module) do
    module.format_board_for_cli(gamestate)
    GameOver.check_for_win_or_tie(gamestate, module)
    GameOver.game_end(module)
  end

  def check_for_win_or_tie(gamestate, module) do
    if Game.is_over?(gamestate.board) do
      cond do
       Game.has_win?(gamestate.board) ->
         announce_winner(gamestate)
       Game.is_tied?(gamestate.board) ->
         IO.puts module.game_tied
      end
    end
  end

  def game_end(module) do
    IO.puts module.game_end
  end

  defp announce_winner(gamestate) do
    icon = Game.winning_icon(gamestate.board)
    player1 = first_player(gamestate)
    player2 = second_player(gamestate)
    case player1.icon == icon do
      true -> IO.puts CliMessages.game_won(player1.name)
      false -> IO.puts CliMessages.game_won(player2.name)
    end
  end

  defp first_player(gamestate) do
    List.first(gamestate.players)
  end

  defp second_player(gamestate) do
    List.last(gamestate.players)
  end

end
