defmodule TicTacToe do

  def main(args \\ []) do
    TicTacToe.init(GameConfig, GameLoop, GameOver, CliMessages)
  end

  def init(game_config, game_loop, game_over, module) do
    game_config.setup(module)
    |> game_config.init
    |> game_loop.init(module)
    |> game_over.init(module)
  end

end
