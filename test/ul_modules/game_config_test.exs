defmodule GameConfigTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  @row_size 3

  @board [
    [nil, nil, nil],
    [nil, nil, nil],
    [nil, nil, nil]
  ]

  @gamestate %{
    board: @board,
    row_size: @row_size,
    player1: nil,
    player2: nil,
    current_player: nil,
    rules: Rules
  }

  describe "init can set the game configuration and the initial gamestate" do
    test "init returns a gamestate with board, row_size, players and rules values" do
      gamesetup = %{
        row_size: 3,
        name: "foo",
        icon: :x,
        turn_order: 1,
        computer_name: "bar",
        computer_icon: :o,
        computer_strategy: FakeStrategy
      }

      gamestate = GameConfig.init(gamesetup)

      assert %GameState{
        board: @board,
        row_size: 3,
        player1: %HumanPlayer{icon: :x, name: "foo"},
        player2: %ComputerPlayer{icon: :o, name: "bar", strategy: FakeStrategy},
        current_player: %HumanPlayer{icon: :x, name: "foo"},
        rules: Rules
      } == gamestate
    end

    test "game_config can set the row size" do
      result = GameConfig.row_size(5)
      assert result == 5
    end

    test "game_config sets a row size of 3 as the default" do
      assert GameConfig.row_size == 3
    end

    test "game_config sets the gamestate" do
      row_size = GameConfig.row_size
      gamestate = GameConfig.init_gamestate(row_size)

      assert gamestate.board == @board
      assert gamestate.row_size == 3
      refute gamestate.rules.has_winning_row?(gamestate.board)
    end
  end

  describe "init can create the players" do
    test "it can create the human player according to the turn order entered" do
      name = "Player 1"
      icon = "x"
      turn_order = 2

      human_player = HumanPlayer.create_player(name, icon)

      result = GameConfig.create_human_player(@gamestate, name, icon, turn_order)
      %{ player2: player2 } = result
      assert Map.equal?(player2, human_player)
    end

    test "it can announce the creation of the computer player" do
      message = "\ncomputer chooses to use the icon: O and will go first.\n"
      execute_main = fn ->
        GameConfig.computer_player_config_message("computer", "O", 2)
      end
      assert capture_io(execute_main) =~ message
    end

    test "it can create the computer player according to the turn order entered" do
      name = "Computer"
      icon = "@"
      turn_order = 2
      strategy = "foo"

      computer_player = ComputerPlayer.create_player(name, icon, strategy)

      result = GameConfig.create_computer_player(@gamestate, name, icon, turn_order, strategy)
      %{ player1: player1 } = result
      assert Map.equal?(player1, computer_player)
    end
  end

end
