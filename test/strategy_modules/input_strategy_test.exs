defmodule InputStrategyTest do
  use ExUnit.Case

  test "it can capture user input when the player selects a move" do
    assert InputStrategy.getInput(FakeMoveIO) == 8
  end
end
