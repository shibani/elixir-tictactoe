defmodule TicTacToe do

  def main(_args \\ []) do
    TicTacToe.init(GameConfig, GameLoop, GameOver)
  end

  def init(game_config, game_loop, game_over) do
    game_config.setup(CliMessages, PlayerConfig)
    |> game_config.init
    |> game_loop.init(CliMessages)
    |> game_over.init(CliMessages)
  end

end
