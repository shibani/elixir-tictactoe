defmodule PlayerTest do
  use ExUnit.Case

  test "should create a player with an icon and a type" do
    player = Player.create_player(:x, "human")
    {_status, icon} = Map.fetch(player, :icon)
    {_status, type} = Map.fetch(player, :type)
    assert icon == :x
    assert type == "human"
  end

  test "should create a player list and add the created players to the list" do
    player1 = Player.create_player(:x, "human")
    player2 = Player.create_player(:o, "computer")
    player_list = Player.player_list(player1, player2)
    {_status, result} = player_list |> List.first |> Map.fetch(:icon)
    assert result == :x
  end

end
