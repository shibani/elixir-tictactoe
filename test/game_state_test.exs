defmodule GameStateTest do
  use ExUnit.Case

  test "should create a gamestate with a board, players, current player and rules" do
    board = "foo"
    player1 = "testplayer1"
    player2 = "testplayer2"
    current_player = "testcurrentplayer"
    rules = "rules"

    gamestate = GameState.create_game_state(board, player1, player2, rules)

    % GameState{ board: gs_board, player1: gs_player1, player2: gs_player2,
    current_player: gs_current_player, rules: gs_rules } = gamestate

    assert gs_board == "foo"
    assert gs_player1 == "testplayer1"
    assert gs_player2 == "testplayer2"
    assert gs_current_player == nil
    assert gs_rules == "rules"
  end

  test "should create a gamestate with a board and players but no current player" do
    board = "foo"
    player1 = "testplayer1"
    player2 = "testplayer2"

    gamestate = GameState.create_game_state(board, player1, player2)

    % GameState{ board: gs_board, player1: gs_player1, player2: gs_player2,
    current_player: gs_current_player } = gamestate

    assert gs_board == "foo"
    assert gs_player1 == "testplayer1"
    assert gs_player2 == "testplayer2"
    assert gs_current_player == nil
  end

  test "should create a gamestate with a board" do
    board = "foo"

    gamestate = GameState.create_game_state(board)

    % GameState{ board: gs_board, player1: gs_player1, player2: gs_player2,
    current_player: gs_current_player } = gamestate

    assert gs_board == "foo"
    assert gs_player1 == nil
    assert gs_player2 == nil
    assert gs_current_player == nil
  end
end
