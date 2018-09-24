defmodule TicTacToe do

  def hello do
    :world
  end

  def main(args \\ []) do
    TicTacToe.init(GameConfig, GameLoop, GameOver)
  end

  def init(game_config, game_loop, game_over) do
    config_gamestate = game_config.init
    loop_gamestate = game_loop.init(config_gamestate)
    game_over.init(loop_gamestate)
  end

end
