defmodule InputStrategyTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @gamestate %{ row_size: 3}

  test "it can capture user input when the player selects a move" do
    assert InputStrategy.get_input(FakeMoveIO, @gamestate) == 8
  end

  test "it returns the input if a valid numeric string is given" do
    input = "5"
    assert InputStrategy.validate(input, @gamestate, FakeMoveIO) == 5
  end


  test "if input is not within board limits, it outputs a try again message" do
    input = "10"
    expected_message = "\nThat is an invalid move, please try again.\n"

    execute_main = fn ->
      InputStrategy.validate(input, @gamestate, FakeMoveIO)
    end

    assert capture_io(execute_main) =~ expected_message
  end

  test "if input is not a numeric string, it outputs a try again message" do
    input = "kflgk."
    expected_message = "\nThat is an invalid move, please try again.\n"

    execute_main = fn ->
      InputStrategy.validate(input, @gamestate, FakeMoveIO)
    end

    assert capture_io(execute_main) =~ expected_message
  end
end
