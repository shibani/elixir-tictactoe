defmodule UserTurnConfigTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "it can set the turn order" do
    test "it can get and trim the entered turn order" do
      message = "\nEnter 1 if you would like to go first or 2 if second:\n"
      assert GameConfig.user_input(message, FakeTurnIO, UserTurnConfig) == 1
    end

    test "it can confirm the user order" do
      turn_order = 1
      expected_message = "Your selected turn order is 1"


      execute_main = fn ->
        UserTurnConfig.confirm(turn_order)
      end

      assert capture_io(execute_main) =~ expected_message
    end

    test "it returns the input if valid" do
      input = "1"
      message = "foo"
      assert UserTurnConfig.validate(input, message) == 1
    end

    test "if input is invalid, it outputs a try again message" do
      input = "xx"
      message = "\nEnter 1 if you would like to go first or 2 if second:\n"
      expected_message = "\nThat was an invalid selection. Please enter 1 if you would like to go first or 2 if second.\n\n"

      execute_main = fn ->
        UserTurnConfig.validate(input, message, FakeTurnIO)
      end

      assert capture_io(execute_main) =~ expected_message
    end
  end
end
