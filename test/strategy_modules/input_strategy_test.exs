defmodule InputStrategyTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "it can capture user input when the player selects a move" do
    assert InputStrategy.get_input(FakeMoveIO) == 8
  end

  test "it returns the input if a valid numeric string is given" do
    input = "5"
    row_size = 3
    assert InputStrategy.validate(input, row_size, FakeMoveIO) == 5
  end


  test "if input is not within board limits, it outputs a try again message" do
    input = "10"
    row_size = 3
    expected_message = "\nThat is an invalid move, please try again.\n"

    execute_main = fn ->
      InputStrategy.validate(input, row_size, FakeMoveIO)
    end

    assert capture_io(execute_main) =~ expected_message
  end

  test "if input is not a numeric string, it outputs a try again message" do
    input = "kflgk."
    row_size = 3
    expected_message = "\nThat is an invalid move, please try again.\n"

    execute_main = fn ->
      InputStrategy.validate(input, row_size, FakeMoveIO)
    end

    assert capture_io(execute_main) =~ expected_message
  end
end
