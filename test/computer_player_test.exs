defmodule ComputerPlayerTest do
  use ExUnit.Case

  test "should create a player with an icon and a type" do
    player = ComputerPlayer.create_player("Player 1", :x)
    {_status, name} = Map.fetch(player,:name)
    {_status, icon} = Map.fetch(player, :icon)
    assert icon == :x
    assert name == "Player 1"
  end

  test "should be able to select a move" do
    input = nil
    board = [
      [:x, :x, :o],
      [:x, nil, :o],
      [:o, :o, :x]
    ]
    player = ComputerPlayer.create_player("Computer", :o)
    result = PlayerMove.select_move(player, board, input)

    assert result == input
  end

end
