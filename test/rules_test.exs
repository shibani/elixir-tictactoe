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
      assert Rules.has_winning_row?(board) == true
    end

    test "has winning column" do
      board = [
        [:x, :x, :o],
        [:x, :o, :o],
        [:x, :o, :x]
      ]
      assert Rules.has_winning_column?(board) == true
    end

    test "has winning diagonal" do
      assert Rules.has_winning_diagonal?(@board) == true
    end

    test "is winning row" do
      assert Rules.is_winning_row?([:x, :x, :x]) == true
      assert Rules.is_winning_row?([:o, :x, :x]) == false
      assert Rules.is_winning_row?([:o, :x, nil]) == false
    end
  end

end
