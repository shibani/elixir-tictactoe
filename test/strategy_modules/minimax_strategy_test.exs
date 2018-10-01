defmodule MinimaxStrategyTest do
  use ExUnit.Case

  @row_size 3

  @human %HumanPlayer{icon: :x, name: "foo"}
  @computer %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy}

  test "picks the only open spot" do
    board = [
      [:x, :x, :o],
      [:x, nil, :o],
      [:o, :o, :x]
    ]

    gamestate = %{ board: board, row_size: @row_size, players: [@human, @computer], current_player: @human, rules: Rules }

    assert 5 == MinimaxStrategy.best_move(gamestate)
  end

  test "picks a win" do
    board = [
      [:x,  :o,  :x],
      [:o,  :o , :x],
      [nil, nil, nil]
    ]
    gamestate = %{ board: board, row_size: @row_size, players: [@computer, @human], current_player: @computer, rules: Rules }

    assert 8 == MinimaxStrategy.best_move(gamestate)
  end

  test "blocks a win" do
    board = [
      [:x,  :o,  :x],
      [nil, :o,  nil],
      [nil, nil, nil]
    ]
    gamestate = %{ board: board, row_size: @row_size, players: [@human, @computer], current_player: @human, rules: Rules }

    assert 8 == MinimaxStrategy.best_move(gamestate)
  end

  test "picks a win when there are more empty spaces" do
    board = [
      [:x,  :o,  :x],
      [nil, :o,  nil],
      [nil, nil, nil]
    ]
    gamestate = %{ board: board, row_size: @row_size, players: [@computer, @human], current_player: @computer, rules: Rules }

    assert 4 == MinimaxStrategy.best_move(gamestate)
  end

  test "it can mark the board given a square and a gamestate" do
    board = [
      [:x, :x, nil],
      [:o, nil, :x],
      [:x, :o, :x]
    ]

    gamestate = %{
      board: board,
      row_size: 3,
      players: [%HumanPlayer{icon: :x, name: "foo"}, %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy}],
      current_player: %HumanPlayer{icon: :x, name: "foo"},
      rules: Rules
    }

    square = 3

    %{ board: board, current_player: current_player } = MinimaxStrategy.place_move(gamestate, square)
    %{row: row, col: col} = Rules.square_to_rows_and_cols(square, gamestate.row_size)

    first_player = Enum.at(gamestate.players, 0)
    second_player = Enum.at(gamestate.players, 1)

    assert Board.get_square(board, row, col) == first_player.icon
    assert Map.equal?(current_player, second_player)
  end
end
