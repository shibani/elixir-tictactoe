defmodule ComputerPlayerTest do
  use ExUnit.Case

  @board [
    [:x, :x, :o],
    [:x, nil, :o],
    [:o, :o, :x]
  ]

  test "should create a player with an icon and a name" do
    player = ComputerPlayer.create_player("Player 1", :x)
    assert player.icon == :x
    assert player.name == "Player 1"
  end

  test "should be able to select a move" do
    gamestate = %{
      board: @board,
      row_size: 3,
      player1: %HumanPlayer{icon: :x, name: "foo"},
      player2: %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy},
      current_player: %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy},
      rules: Rules
    }

    result = PlayerMove.select_move(gamestate.current_player, gamestate)

    assert result == 6
  end

  test "has a strategy module" do
    player = ComputerPlayer.create_player("Computer", :o, FakeStrategy)
    assert player.strategy == FakeStrategy
  end

  test "it should set a name" do
    message = ""
    assert ComputerPlayer.get_name(message, IO) == "Computer"
  end

  test "it should set an icon" do
    message = ""
    assert ComputerPlayer.get_icon(message, IO) == "@"
  end

  test "it should set a turn order" do
    message = "2"
    assert ComputerPlayer.get_turn_order(message, IO) == "1"
  end

  test "it should confirm the computer's player name" do
    input = "Computer"
    assert ComputerPlayer.confirm_name(input) == "Computer's name will be Computer"
  end

  test "it should confirm the computer's icon" do
    input = "@"
    assert ComputerPlayer.confirm_icon(input) == "Computer's icon will be @"
  end

  test "it should confirm the computer's turn order" do
    input = "1"
    assert ComputerPlayer.confirm_turn_order(input) == "Computer will go first"
  end

end
