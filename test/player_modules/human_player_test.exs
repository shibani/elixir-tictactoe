defmodule HumanPlayerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @board [
    [:x, :x, :o],
    [:x, nil, :o],
    [:o, :o, :x]
  ]

  test "should create a player with an icon and a type" do
    player = HumanPlayer.create_player("Player 1", :x)
    {_status, name} = Map.fetch(player, :name)
    {_status, icon} = Map.fetch(player, :icon)

    assert icon == :x
    assert name == "Player 1"
  end

  test "should be able to select a move" do
    gamestate = %{
      board: @board,
      row_size: 3,
      player1: %HumanPlayer{icon: :x, name: "foo", strategy: FakeStrategy},
      player2: %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy},
      current_player: %HumanPlayer{icon: :x, name: "foo", strategy: FakeStrategy},
      rules: Rules
    }

    result = PlayerMove.select_move(gamestate.current_player, gamestate)

    assert result == 3
  end

  test "has a strategy module" do
    player = HumanPlayer.create_player("Player 1", :x, FakeStrategy)
    assert player.strategy == FakeStrategy
  end

  test "it can get a name" do
    message1 = "Please enter the name you'd like to play as:\n"
    assert HumanPlayer.get_name(message1, FakeNameIO) == "Human Player"
  end

  test "it can get an icon" do
    message1 = "\nPlease enter any alpha character as your icon:\n"
    assert HumanPlayer.get_icon(message1, FakeIconIO) == "X"
  end

  test "it can get the turn order" do
    message1 = "\nEnter 1 if you would like to go first or 2 if second:\n"
    assert HumanPlayer.get_turn_order(message1, FakeTurnIO) == "1"
  end

  test "it can ask for the player's name" do
    message = "Please enter the name you'd like to play as:\n"
    assert HumanPlayer.ask_for_input(message, FakeNameIO) == "Human Player"
  end

  test "it can get and trim the entered icon" do
    message = "\nPlease enter any alpha character as your icon:\n"
    assert HumanPlayer.ask_for_input(message, FakeIconIO) == "X"
  end

  test "it can get and trim the entered turn order" do
    message = "\nEnter 1 if you would like to go first or 2 if second:\n"
    assert HumanPlayer.ask_for_input(message, FakeTurnIO) == "1"
  end

  test "it returns the name if valid" do
    input = "X"
    message = "foo"
    assert HumanPlayer.validate_name(input, message, FakeNameIO) == "X"
  end

  test "if name is invalid, it outputs a try again message" do
    input = "    "
    trimmed_input = input |> String.trim
    message = "Please enter the name you'd like to play as:\n"
    expected_message = "\nName should not be empty, please try again\n"

    execute_main = fn ->
      HumanPlayer.validate_name(trimmed_input, message, FakeNameIO)
    end
    assert capture_io(execute_main) =~ expected_message
  end

  test "it returns the icon if valid" do
    input = "o"
    message = "foo"
    assert HumanPlayer.validate_icon(input, message) == "o"
  end

  test "if icon is invalid, it outputs a try again message" do
    input = "xx"
    message = "\nPlease enter any alpha character as your icon:\n"
    expected_message = "That was an invalid selection. Icon should be one alpha character. Please try again."

    execute_main = fn ->
      HumanPlayer.validate_icon(input, message, FakeIconIO)
    end

    assert capture_io(execute_main) =~ expected_message
  end

  test "it returns the turn order if valid" do
    input = "1"
    message = "foo"
    assert HumanPlayer.validate_turn_order(input, message) == "1"
  end

  test "if turn order is invalid, it outputs a try again message" do
    input = "xx"
    message = "\nEnter 1 if you would like to go first or 2 if second:\n"
    expected_message = "\nThat was an invalid selection. Please enter 1 if you would like to go first or 2 if second.\n\n"

    execute_main = fn ->
      HumanPlayer.validate_turn_order(input, message, FakeTurnIO)
    end

    assert capture_io(execute_main) =~ expected_message
  end

  test "it can confirm the user name" do
    name = "Human Player"
    expected_message = "Your selected player name is Human Player"

    # execute_main = fn ->
    #   HumanPlayer.confirm_name(name)
    # end

    # assert capture_io(execute_main) =~ expected_message
    assert HumanPlayer.confirm_name(name) == expected_message
  end

  test "it can confirm the user icon" do
    icon = "X"
    expected_message = "Your selected icon is X"

    # execute_main = fn ->
    #   HumanPlayer.confirm_icon(icon)
    # end

    # assert capture_io(execute_main) =~ expected_message
    assert HumanPlayer.confirm_icon(icon) == expected_message
  end

  test "it can confirm the user turn order" do
    turn_order = "1"
    expected_message = "Your selected turn order is 1"

    # execute_main = fn ->
    #   HumanPlayer.confirm_turn_order(turn_order)
    # end

    # assert capture_io(execute_main) =~ expected_message
    assert HumanPlayer.confirm_turn_order(turn_order) == expected_message
  end
end
