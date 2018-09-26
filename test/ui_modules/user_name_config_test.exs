defmodule UserNameConfigTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  describe "it can set the user name" do
    test "it can get and trim the entered name" do
      message = "Please enter the name you'd like to play as:\n"
      assert GameConfig.user_input(message, FakeNameIO, UserNameConfig) == "Human Player"
    end

    test "it can confirm the user name" do
      name = "Human Player"
      expected_message = "Your selected user name is Human Player"

      execute_main = fn ->
        UserNameConfig.confirm(name)
      end

      assert capture_io(execute_main) =~ expected_message
    end

    test "it returns the input if valid" do
      input = "X"
      message = "foo"
      assert UserNameConfig.validate(input, message) == "X"
    end

    test "if input is invalid, it outputs a try again message" do
      input = "    "
      trimmed_input = input |> String.trim
      message = "Please enter the name you'd like to play as:\n"
      expected_message = "\nName should not be empty, please try again\n"

      execute_main = fn ->
        UserNameConfig.validate(trimmed_input, message, FakeNameIO)
      end

      assert capture_io(execute_main) =~ expected_message
    end

  end
end
