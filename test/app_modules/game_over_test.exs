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
    players: [@player1, @player2],
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
    players: [],
    current_player: nil,
    rules: Rules
  }

  @board3 [
    [:x, :x, :x],
    [:o, :o, nil],
    [:x, :o, nil]
  ]

  @gamestate3 %{
    board: @board3,
    row_size: @row_size,
    players: [@player1, @player2],
    current_player: nil,
    rules: Rules
  }

  test "init outputs a game over message" do
    message = "\nThank you for playing!\n"
    execute_main = fn ->
      GameOver.init(@gamestate1, FakeCliMessages)
    end
    assert capture_io(execute_main) =~ message
  end


  test "it can check if the game is over" do
    message = "\nPlayer 1 wins!\n"
    module = CliMessages
    execute_main = fn ->
      GameOver.check_for_win_or_tie(@gamestate1, module)
    end

    assert capture_io(execute_main) =~ message
  end

  test "it can check who won" do
    message = "\nComputer wins!\n"
    module = CliMessages
    execute_main = fn ->
      GameOver.check_for_win_or_tie(@gamestate3, module)
    end

    assert capture_io(execute_main) =~ message
  end

  test "it can check if the game is tied" do
    message = "\nGame is tied!\n"
    module = CliMessages
    execute_main = fn ->
      GameOver.check_for_win_or_tie(@gamestate2, module)
    end

    assert capture_io(execute_main) =~ message
  end

  test "it can output a final message that ends the game" do
    message = "\nThank you for playing!\n"
    module = CliMessages
    execute_main = fn ->
      GameOver.game_end(module)
    end

    assert capture_io(execute_main) =~ message
  end
end
