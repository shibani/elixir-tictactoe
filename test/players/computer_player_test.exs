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

end
