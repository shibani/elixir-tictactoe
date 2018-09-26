defmodule TicTacToe do

  def main(args \\ []) do
    TicTacToe.init(GameConfig, GameLoop, GameOver)
  end

  def init(game_config, game_loop, game_over) do
    game_config.setup
    |> game_config.init
    |> game_loop.init
    |> game_over.init
  end

end
