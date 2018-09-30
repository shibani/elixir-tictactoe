defmodule RulesTest do
  use ExUnit.Case

  @board [
    [:x, :x, :o],
    [:x, :o, :o],
    [:o, :o, :x]
  ]

  describe "board can have winning combinations" do
    test "has winning row" do
      board = [
        [:x, :x, :o],
        [:o, :o, :o],
        [:o, :o, :x]
      ]
      assert Rules.has_winning_row?(board)
    end

    test "winning row method does not return a win when row is full of nils" do
      board = [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
      ]
      refute Rules.has_winning_row?(board)
    end

    test "has winning column" do
      board = [
        [:x, :x, :o],
        [:x, :o, :o],
        [:x, :o, :x]
      ]
      assert Rules.has_winning_column?(board)
    end

    test "has winning diagonal" do
      assert Rules.has_winning_diagonal?(@board)
    end

    test "is winning row" do
      assert Rules.is_winning_row?([:x, :x, :x])
      refute Rules.is_winning_row?([:o, :x, :x])
      refute Rules.is_winning_row?([:o, :x, nil])
    end

    test "it can convert a position to rows and columns" do
      square = 6
      row_size = 3
      assert Rules.square_to_rows_and_cols(square, row_size) == %{ row: 1, col: 2}
    end
  end

end
