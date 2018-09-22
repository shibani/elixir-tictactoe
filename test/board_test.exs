defmodule BoardTest do
  use ExUnit.Case

  @board [
    [:x, :x, :o],
    [:x, :o, :o],
    [:o, :o, :x]
  ]

  describe "creating a board" do
    test "3x3 board has 9 spaces" do
      assert [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]] == Board.create_board(3)
    end

    test "4x4 board has 16 spaces" do
      assert [
               [nil, nil, nil, nil],
               [nil, nil, nil, nil],
               [nil, nil, nil, nil],
               [nil, nil, nil, nil]
             ] == Board.create_board(4)
    end
  end

  describe "rows, columns, diagonals" do
    test "gets columns" do
      assert Board.columns(@board) == [[:x, :x, :o], [:x, :o, :o], [:o, :o, :x]]
    end

    test "gets rows" do
      assert Board.rows(@board) == @board
    end

    test "get diagonals" do
      assert Board.diagonals(@board) == [[:x, :o, :x], [:o, :o, :o]]
    end

    test "get a row by its row index" do
      assert Board.get_row_at(@board, 0) == [:x, :x, :o]
    end

    test "get a column by its column index" do
      assert Board.get_col_at(@board, 1) == [:x, :o, :o]
    end
  end

  describe "board can be full or not" do
    test "board is not full" do
      board = [
        [:x, :x, nil],
        [:o, nil, :x],
        [:x, :o, :x]
      ]
      assert Board.is_full?(board) == false
    end

    test "board is full" do
      assert Board.is_full?(@board) == true
    end
  end

  describe "board can check if a move is valid" do
    test "can get a square" do
      board = [
        [:x, :x, nil],
        [:o, nil, :x],
        [:x, :o, :x]
      ]

      assert Board.get_square(board, 0, 1) == :x
    end

  end

end
