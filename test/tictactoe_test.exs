defmodule TicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "greets the world" do
    assert TicTacToe.hello() == :world
  end

end
