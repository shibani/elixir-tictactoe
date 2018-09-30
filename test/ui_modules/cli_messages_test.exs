defmodule CliMessagesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @board  [
    [:x, nil, :o],
    [:o, nil, :x],
    [:x, :o, nil]
  ]

  @gamestate %{
    board: @board,
    row_size: 3,
    player1: %HumanPlayer{icon: :x, name: "foo"},
    player2: %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy},
    current_player: %HumanPlayer{icon: :x, name: "foo"},
    rules: Rules
  }

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

    gamestate = %{
      board: board,
      row_size: 3,
      player1: %HumanPlayer{icon: :x, name: "foo"},
      player2: %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy},
      current_player: %HumanPlayer{icon: :x, name: "foo"},
      rules: Rules
    }

    formatted_board =
"| x | 2 | o |
-------------
| o | 5 | x |
-------------
| x | o | 9 |\n"

    execute_main = fn ->
      CliMessages.format_board_for_cli(gamestate)
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

  test "it returns a message to confirm the user's name" do
    message = "Your selected player name is "
    assert CliMessages.confirm_name == message
  end

  test "it returns a message to confirm the user's icon" do
    message = "Your selected icon is "
    assert CliMessages.confirm_icon == message
  end

  test "it returns a message to confirm the user's turn_order" do
    message = "Your selected turn order is "
    assert CliMessages.confirm_turn_order == message
  end

  test "it returns a message if the user's name is invalid" do
    message = "\nName should not be empty, please try again\n"
    assert CliMessages.invalid_user_name == message
  end

  test "it has an invalid user icon message" do
    message = "\nThat was an invalid selection. Icon should be one alpha character. Please try again.\n"
    assert CliMessages.invalid_user_icon == message
  end

  test "it has an invalid user turn order message" do
    message = "\nThat was an invalid selection. Please enter 1 if you would like to go first or 2 if second.\n"

    assert CliMessages.invalid_turn_order == message
  end

  test "it can return a name for the computer" do
    message = "Computer"
    assert CliMessages.computer_name == message
  end

  test "it can return an icon for the computer" do
    message = "@"
    assert CliMessages.computer_icon == message
  end

  test "it returns a message to confirm the computer's name" do
    message = "Computer's name will be "
    assert CliMessages.confirm_computer_name == message
  end

  test "it returns a message to confirm the computer's icon" do
    message = "Computer's icon will be "
    assert CliMessages.confirm_computer_icon == message
  end

  test "it returns a message to confirm the computer's turn order" do
    message = "Computer will go "
    assert CliMessages.confirm_computer_turn_order == message
  end

  test "it can return a string formatted computer turn order" do
    user_turn_order = 1
    expected_message = "second"
    assert CliMessages.format_computer_turn_order(user_turn_order) == expected_message
  end

  test "it returns a message to confirm the computer's configuration settings" do
    name = "Computer"
    icon = "@"
    order = "first"
    message = "\nComputer chooses to use the icon: @ and will go first.\n"
    assert CliMessages.computer_config(name, icon, order) == message
  end

  test "given a gamestate, it can announce a turn" do
    message = "foo, your turn. Please select a move between 1 - 9:"
    assert CliMessages.announce_turn(@gamestate) == message
  end

  test "given a gamestate and a move, it can confirm the selected move" do
    move = 9
    message = "\nfoo selects square 9. Placing foo's move.\n"
    assert CliMessages.confirm_move(@gamestate, move) == message
  end

  test "it returns a message to as for a move if entered manually" do
    message = "\nEnter your move:\n"
    assert CliMessages.input_strategy_move == message
  end

  test "it can print an invalid, please try again message" do
    message = "\nThat is an invalid move, please try again.\n"
    assert CliMessages.invalid_try_again == message
  end

  test "it returns a message when the game is won" do
    name = "Player1"
    message = "\nPlayer1 wins!"
    assert CliMessages.game_won(name) == message
  end

  test "it returns a message when the game is tied" do
    message = "\nGame is tied!"
    assert CliMessages.game_tied == message
  end

  test "it returns a message when the game has ended" do
    message = "\nThank you for playing!\n"
    assert CliMessages.game_end == message
  end

end
