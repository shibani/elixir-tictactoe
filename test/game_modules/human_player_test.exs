defmodule HumanPlayerTest do
  use ExUnit.Case

  test "should create a player with an icon and a type" do
    player = HumanPlayer.create_player("Player 1", :x)
    {_status, name} = Map.fetch(player, :name)
    {_status, icon} = Map.fetch(player, :icon)

    assert icon == :x
    assert name == "Player 1"
  end

  test "should be able to select a move" do
    input = 4
    board = [
      [:x, :x, :o],
      [:x, :o, :o],
      [:o, :o, :x]
    ]
    player = HumanPlayer.create_player("Player 1", :x)
    result = PlayerMove.select_move(player, board)

    assert result == input
  end

end
