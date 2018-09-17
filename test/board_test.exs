defmodule BoardTest do

  use ExUnit.Case
  doctest Board

  test "should create a board with squares equal to the square of the row-size entered" do
    row_size = 3
    board = Board.create_board(row_size)
    assert map_size(board) == 9
  end

  test "board map should have integer atoms as keys" do
    row_size = 3
    position = Enum.random(1..row_size * row_size)
    position_key = position |> Integer.to_string() |> String.to_atom()
    board = Board.create_board(row_size)
    {status, _} = Map.fetch(board, position_key)
    assert status == :ok
  end

  test "board squares should be filled with integer value of position at start of game" do
    row_size = 3
    position = Enum.random(1..row_size * row_size)
    position_key = position |> Integer.to_string() |> String.to_atom()
    board = Board.create_board(row_size)
    {_, result} = Map.fetch(board, position_key)
    assert result == position
  end

  test "board should return true if a move is valid" do
    row_size = 3
    board = Board.create_board(row_size)
    position = 5
    result = Board.valid_move?(board, position)
    assert result == true
  end

  test "board should have winning combinations" do
    row_size = 3
    win_combinations = Board.winning_combinations(row_size)
    assert length(win_combinations) == 8
  end

  test "board should have a winning combination for each row of squares" do
    row_size = 3
    win_combinations = Board.winning_combinations(row_size)
    assert Enum.member?(win_combinations, [1,2,3])
    assert Enum.member?(win_combinations, [4,5,6])
    assert Enum.member?(win_combinations, [7,8,9])
  end

  test "board should have a winning combination for each column of squares" do
    row_size = 3
    win_combinations = Board.winning_combinations(row_size)
    assert Enum.member?(win_combinations, [1,4,7])
    assert Enum.member?(win_combinations, [2,5,8])
    assert Enum.member?(win_combinations, [3,6,9])
  end

  test "board should have a winning combination for each diagonal" do
    row_size = 3
    win_combinations = Board.winning_combinations(row_size)
    assert Enum.member?(win_combinations, [1,5,9])
    assert Enum.member?(win_combinations, [3,5,7])
  end

  test "board can convert a position to a key to access map values" do
    position = 5
    assert Board.position_to_key_atom(position) == :"5"
  end

  test "board can convert a position atom from map back to a position" do
    position_atom = :"5"
    assert Board.key_atom_to_position(position_atom) == 5
  end

end
