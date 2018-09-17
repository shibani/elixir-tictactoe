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
end
