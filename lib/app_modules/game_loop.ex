defmodule GameLoop do

  def init(gamestate, module) do
    IO.puts "gameloop was called"
    CliMessages.format_board_for_cli(gamestate.board, gamestate.row_size)
    gamestate
  end

end
