defmodule GameLoopTest do
  use ExUnit.Case

  @board [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil]
  ]

  test "it can get a move when given a gamestate" do
    gamestate = %{
      board: @board,
      row_size: 3,
      player1: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      player2: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      current_player: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      rules: Rules
    }

    assert GameLoop.get_move(gamestate, FakeCliMessages) == 3
  end

  test "it can check if a move is valid and place it on the board" do

    board2 = [
      [nil, nil, nil],
      [nil, :x, nil],
      [nil, nil, nil]
    ]

    gamestate = %{
      board: @board,
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

  test "init returns a gamestate" do
    board = [
      [:x, :x, :x],
      [nil, :o, :o],
      [nil, nil, nil]
    ]

    gamestate = %{
      board: board,
      row_size: 3,
      player1: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      player2: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      current_player: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      rules: Rules
    }

    assert GameLoop.init(gamestate, FakeCliMessages) == gamestate
  end

  test "play loop runs the game loop" do
    board = [
      [:x, :x, :x],
      [nil, :o, :o],
      [nil, nil, nil]
    ]

    gamestate = %{
      board: board,
      row_size: 3,
      player1: %HumanPlayer{name: "Player 1", icon: :x, strategy: FakeStrategy},
      player2: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      current_player: %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy},
      rules: Rules
    }

    assert GameLoop.play_loop(gamestate, FakeCliMessages) == gamestate
  end
end
