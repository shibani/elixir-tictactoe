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
    @tag :skip
    test "init returns a gamestate with board, row_size, players and rules values" do
      row_size = GameConfig.row_size
      gamestate = GameConfig.init_gamestate(row_size)

      assert %{
        board: @board,
        row_size: row_size,
        player1: nil,
        player2: nil,
        current_player: nil,
        rules: Rules
      } == GameConfig.init
    end


    test "game_config can set the row size" do
      assert GameConfig.row_size(5) == 5
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

  describe "it can create players according to the turn order entered" do
    name = "Player 1"
    icon = "x"
    turn_order = 2

    result = GameConfig.create_user_generated_player(@gamestate, name, icon, turn_order)
    assert result == "create computer player first, then human player"
  end

end
