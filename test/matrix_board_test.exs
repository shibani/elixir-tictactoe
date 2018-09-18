defmodule MatrixBoardTest do
  use ExUnit.Case

  describe "creating a board" do
    test "3x3 board has 9 spaces" do
      assert [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]] == MatrixBoard.create_board(3)
    end

    test "4x4 board has 16 spaces" do
      assert [
               [nil, nil, nil, nil],
               [nil, nil, nil, nil],
               [nil, nil, nil, nil],
               [nil, nil, nil, nil]
             ] == MatrixBoard.create_board(4)
    end
  end

  describe "rows, columns, diagonals" do
    test "gets columns" do
      board = [
        [:x, :x, :o],
        [:x, :o, :o],
        [:o, :o, :x]
      ]

      assert MatrixBoard.columns(board) == [[:x, :x, :o], [:x, :o, :o], [:o, :o, :x]]
    end

    test "gets rows" do
      board = [
        [:x, :x, :o],
        [:x, :o, :o],
        [:o, :o, :x]
      ]

      assert MatrixBoard.rows(board) == board
    end

    test "get diagonals" do
      board = [
        [:x, :x, :o],
        [:x, :o, :o],
        [:o, :o, :x]
      ]

      assert MatrixBoard.diagonals(board) == [[:x, :o, :x], [:o, :o, :o]]
    end
  end

  test "placing a move" do
    board = MatrixBoard.create_board(3)
    updated = MatrixBoard.mark_square(board, 0, 0, :x)
    assert updated == [[:x, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  test "get a row by its row index" do
    board = [
      [:x, :x, :o],
      [:x, :o, :o],
      [:o, :o, :x]
    ]
    assert MatrixBoard.get_row_at(board, 0) == [:x, :x, :o]
  end

  test "get a column by its column index" do
    board = [
      [:x, :x, :o],
      [:x, :o, :o],
      [:o, :o, :x]
    ]
    assert MatrixBoard.get_col_at(board, 1) == [:x, :o, :o]
  end

  test "has winning row" do
    board = [
      [:x, :x, :x],
      [:x, :o, :o],
      [:o, :o, :x]
    ]
    assert MatrixBoard.has_winning_row?(board) == true
  end

  test "has winning column" do
    board = [
      [:x, :x, :o],
      [:x, :o, :o],
      [:x, :o, :x]
    ]
    assert MatrixBoard.has_winning_column?(board) == true
  end

  test "has winning diagonal" do
    board = [
      [:x, :x, :o],
      [:o, :x, :o],
      [:o, :o, :x]
    ]
    assert MatrixBoard.has_winning_diagonal?(board) == true
  end

  test "is winning row" do
    assert MatrixBoard.is_winning_row?([:x, :x, :x]) == true
    assert MatrixBoard.is_winning_row?([:o, :x, :x]) == false
    assert MatrixBoard.is_winning_row?([:o, :x, nil]) == false
  end

  test "board has win" do
    board = [
      [:x, :o, :x],
      [:o, :x, :x],
      [:o, :o, :o]
    ]
    assert MatrixBoard.has_win?(board) == true
  end

  test "board does not have win" do
    board = [
      [:x, :x, :o],
      [:o, :o, :x],
      [:x, :o, :x]
    ]
    assert MatrixBoard.has_win?(board) == false
  end

  test "board is not full" do
    board = [
      [:x, :x, 3],
      [:o, 5, :x],
      [:x, :o, :x]
    ]
    assert MatrixBoard.is_full?(board) == false
  end

  test "board is full" do
    board = [
      [:x, :x, :o],
      [:o, :x, :x],
      [:x, :o, :x]
    ]
    assert MatrixBoard.is_full?(board) == true
  end

  test "board is not tied" do
    board = [
      [:x, :x, 3],
      [:o, 5, :x],
      [:x, :o, :x]
    ]
    assert MatrixBoard.is_tied?(board) == false
  end

  test "board is tied" do
    board = [
      [:x, :x, :o],
      [:o, :x, :x],
      [:x, :o, :o]
    ]
    assert MatrixBoard.is_tied?(board) == true
  end

  test "board is full but not tied because it is won" do
    board = [
      [:x, :x, :o],
      [:o, :x, :x],
      [:o, :o, :o]
    ]
    assert MatrixBoard.is_tied?(board) == false
  end
end

