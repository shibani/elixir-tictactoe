defmodule UserIconConfigTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "it can set the user icon" do
    test "it can get and trim the entered icon" do
      message = "\nPlease enter any alpha character as your icon:\n"
      assert GameConfig.user_input(message, FakeIconIO, UserIconConfig) == "X"
    end

    test "it can confirm the user icon" do
      icon = "X"
      expected_message = "Your selected user icon is X"

      execute_main = fn ->
        UserIconConfig.confirm(icon)
      end

      assert capture_io(execute_main) =~ expected_message
    end

    test "it returns the input if valid" do
      input = "o"
      message = "foo"
      assert UserNameConfig.validate(input, message) == "o"
    end

    test "if input is invalid, it outputs a try again message" do
      input = "xx"
      message = "\nPlease enter any alpha character as your icon:\n"
      expected_message = "That was an invalid selection. Icon should be one alpha character. Please try again."

      execute_main = fn ->
        UserIconConfig.validate(input, message, FakeIconIO)
      end

      assert capture_io(execute_main) =~ expected_message
    end
  end
end
