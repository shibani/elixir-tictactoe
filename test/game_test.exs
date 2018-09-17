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
  
  # test "board returns true if a game is won" do
  #   row_size = 3
  #   win_combinations = Board.winning_combinations(row_size)
  #   board = Board.create_board(row_size)
  #   # Map.update(board, 1, "X")
  #   # Map.update(board, 2, "X")
  #   # Map.update(board, 3, "X")
  #   IO.puts board
  # end
end
