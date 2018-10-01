defmodule HumanPlayerTest do
  use ExUnit.Case

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
      players: [%HumanPlayer{icon: :x, name: "foo", strategy: FakeStrategy}, %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy}],
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
end
