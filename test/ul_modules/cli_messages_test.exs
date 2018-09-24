defmodule CliMessagesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "should have a welcome message" do
    message = "\nWelcome to Tictactoe, human vs computer version\n"
    execute_main = fn ->
      CliMessages.welcome_message
    end
    assert capture_io(execute_main) =~ message
  end

  test "when given a board it should be able to format it for the CLI" do
    board = [
      [:x, nil, :o],
      [:o, nil, :x],
      [:x, :o, nil]
    ]
    row_size = 3
    formatted_board =
"| x | 2 | o |
-------------
| o | 5 | x |
-------------
| x | o | 9 |\n"

    execute_main = fn ->
      CliMessages.format_board_for_cli(board, row_size)
    end

    assert capture_io(execute_main) =~ formatted_board
  end

  test "it should ask for the human player name" do
    message = "Please enter the name you'd like to play as:\n"

    assert CliMessages.ask_for_name == message
  end

  test "it should ask for the human player icon" do
    message = "\nPlease enter any alpha character as your icon:\n"

    assert CliMessages.ask_for_icon == message
  end

  test "it should ask for the player turn order" do
    message = "\nEnter 1 if you would like to go first or 2 if second:\n"

    assert CliMessages.ask_for_turn_order == message
  end

  test "it has an invalid user icon message" do
    message = "\nThat was an invalid selection. Icon should be one alpha character. Please try again.\n"

    assert CliMessages.invalid_user_icon == message
  end

  test "it has an invalid user turn order message" do
    message = "\nThat was an invalid selection. Please enter 1 if you would like to go first or 2 if second.\n"

    assert CliMessages.invalid_turn_order == message
  end

end
