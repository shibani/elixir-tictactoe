defmodule PlayerManagerTest do
  use ExUnit.Case

  test "should create a player list and add the created players to the list" do
    player1 = HumanPlayer.create_player("Player 1", :x)
    player2 = ComputerPlayer.create_player("Computer", :o)
    player_list = PlayerManager.player_list(player1, player2)
    {_status, result} = player_list |> List.first |> Map.fetch(:icon)
    assert result == :x
  end
end
