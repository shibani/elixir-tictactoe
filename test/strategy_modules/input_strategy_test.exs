defmodule InputStrategyTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "it can capture user input when the player selects a move" do
    assert InputStrategy.get_input(FakeMoveIO) == 8
  end

  test "it can validate the input submitted" do
    input = 5
    row_size = 3
    assert InputStrategy.validate(input, row_size, FakeMoveIO) == 5
  end

  test "it returns the input if valid" do
    input = 5
    row_size = 3
    assert InputStrategy.validate(input, row_size, FakeMoveIO) == 5
  end


  test "if input is invalid, it outputs a try again message" do
    input = 10
    row_size = 3
    expected_message = "\nThat is an invalid move, please try again.\n"

    execute_main = fn ->
      InputStrategy.validate(input, row_size, FakeMoveIO)
    end

    assert capture_io(execute_main) =~ expected_message
  end
end
