defmodule MinimaxStrategyTest do
  use ExUnit.Case

  @board [
    [:x, :x, :o],
    [:x, nil, :o],
    [:o, :o, :x]
  ]

  test "picks the only open spot" do
    assert 5 == MinimaxStrategy.best_move(@board)
  end

  @tag :skip
  test "picks a win" do
    board = [
      [:x,  :o,  :x],
      [nil, :o , nil],
      [nil, nil, nil]
    ]

    assert 8 == MinimaxStrategy.best_move(@board)
  end
end
