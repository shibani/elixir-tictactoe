defmodule GameLoopTest do
  use ExUnit.Case

  test "it can get a move when given a gamestate" do
    board1 = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]

    gamestate = %{
      board: board1,
      row_size: 3,
      player1: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      player2: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      current_player: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      rules: Rules
    }

    assert GameLoop.get_move(gamestate, FakeCliMessages) == 3
  end

  test "it can check if a move is valid and place it on the board" do
    board1 = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]

    board2 = [
      [nil, nil, nil],
      [nil, :x, nil],
      [nil, nil, nil]
    ]

    gamestate = %{
      board: board1,
      row_size: 3,
      player1: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      player2: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      current_player: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      rules: Rules
    }

    move = 5
    module = FakeCliMessages

    new_gamestate = %{
      board: board2,
      row_size: 3,
      player1: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      player2: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      current_player: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      rules: Rules
    }

    assert GameLoop.check_for_validity_and_place_move(gamestate, move, module) == new_gamestate
  end

  test "it can check if the game is over and return a gamestate" do
    board = [
      [:x, :o, :x],
      [:x, :o, nil],
      [nil,:o, nil]
    ]

    gamestate = %{
      board: board,
      row_size: 3,
      player1: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      player2: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      current_player: %HumanPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      rules: Rules
    }

    assert GameLoop.check_if_game_is_over_or_loop_again(gamestate) == gamestate
  end
end
