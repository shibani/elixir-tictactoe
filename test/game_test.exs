defmodule GameTest do

  use ExUnit.Case
  doctest Game

  test "game can place a move" do
    board = Board.create_board(3)
    position = 8
    icon = "X"
    result = Game.place_move(position, board, icon)
    assert(Map.get(result, Board.position_to_key_atom(position)) == "X")
  end

  test "board returns true if a game is won" do
    row_size = 3
    position_key_1 = Board.position_to_key_atom(1)
    position_key_2 = Board.position_to_key_atom(2)
    position_key_3 = Board.position_to_key_atom(3)
    board = Board.create_board(row_size)
    |> Map.put(position_key_1, "X")
    |> Map.put(position_key_2, "X")
    |> Map.put(position_key_3, "X")
    assert Game.won?(board, 3) == true
  end
end
