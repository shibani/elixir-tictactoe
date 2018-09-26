defmodule GameOverTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @row_size 3

  @board1 [
    [:x, :x, :o],
    [:o, :x, :x],
    [:o, :o, :o]
  ]

  @player1 %HumanPlayer{ name: "Player 1", icon: :o}
  @player2 %ComputerPlayer { name: "Computer", icon: :x}

  @gamestate1 %{
    board: @board1,
    row_size: @row_size,
    player1: @player1,
    player2: @player2,
    current_player: nil,
    rules: Rules
  }

  @board2 [
    [:x, :x, :o],
    [:o, :x, :x],
    [:x, :o, :o]
  ]

  @gamestate2 %{
    board: @board2,
    row_size: @row_size,
    player1: nil,
    player2: nil,
    current_player: nil,
    rules: Rules
  }

  @board3 [
    [:x, :x, :x],
    [:o, :o, nil],
    [:x, :o, nil]
  ]

  @gamestate2 %{
    board: @board2,
    row_size: @row_size,
    player1: nil,
    player2: nil,
    current_player: nil,
    rules: Rules
  }

  @gamestate3 %{
    board: @board3,
    row_size: @row_size,
    player1: @player1,
    player2: @player2,
    current_player: nil,
    rules: Rules
  }

  test "it can check if the game is over" do
    message = "\nPlayer 1 wins!\n"
    execute_main = fn ->
      GameOver.check_for_win_or_tie(@gamestate1)
    end

    assert capture_io(execute_main) =~ message
  end

  test "it can check who won even if the board isn't full" do
    message = "\nComputer wins!\n"
    execute_main = fn ->
      GameOver.check_for_win_or_tie(@gamestate3)
    end

    assert capture_io(execute_main) =~ message
  end

  test "it can check if the game is tied" do
    message = "\nGame is tied!\n"
    execute_main = fn ->
      GameOver.check_for_win_or_tie(@gamestate2)
    end

    assert capture_io(execute_main) =~ message
  end

  test "it can output a final message that ends the game" do
    message = "\nThank you for playing!\n"
    execute_main = fn ->
      GameOver.game_end
    end

    assert capture_io(execute_main) =~ message
  end
end
