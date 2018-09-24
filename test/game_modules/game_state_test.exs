defmodule GameStateTest do
  use ExUnit.Case

  describe "should create a gamestate with a board, row_size, players, current player and rules" do
    test "gamestate's board, row_size and rules should have initial values when created" do
      board = "foo"
      row_size = 4
      rules = "rules"

      gamestate = GameState.create_game_state(board, row_size, rules)

      % GameState{ board: gs_board, row_size: gs_row_size, player1: gs_player1, player2: gs_player2,
      current_player: gs_current_player, rules: gs_rules } = gamestate

      assert gs_board == "foo"
      assert gs_row_size == 4
      assert gs_player1 == nil
      assert gs_player2 == nil
      assert gs_current_player == nil
      assert gs_rules == "rules"
    end
  end

  describe "update game state" do
    test "should update the gamestate when given the first player" do
      board = "foo"
      row_size = 3
      rules = "rules"

      gamestate = GameState.create_game_state(board, row_size, rules)
      player = HumanPlayer.create_player("Player 1", :x)
      new_gamestate = GameState.set_first_player(gamestate, player)

      assert Map.equal?(new_gamestate.player1, player)
      assert Map.equal?(new_gamestate.current_player, player)
    end

    test "should update the gamestate when given the second player" do
      board = "foo"
      row_size = 3
      rules = "rules"

      player1 = HumanPlayer.create_player("Player1", :x)
      player2 = ComputerPlayer.create_player("Computer", :o)
      gamestate = GameState.create_game_state(board, row_size, rules)
      |> GameState.set_first_player(player1)
      |> GameState.set_second_player(player2)

      assert Map.equal?(gamestate.player2, player2)
    end

    test "gamestate can switch the current player" do
      board = "foo"
      row_size = 3
      rules = "rules"

      player1 = HumanPlayer.create_player("Player 1", :x)
      player2 = ComputerPlayer.create_player("Computer", :o)

      gamestate = GameState.create_game_state(board, row_size, rules)
      |> GameState.set_first_player(player1)
      |> GameState.set_second_player(player2)
      |> GameState.switch_current_player_in_gamestate

      %{ current_player: current_player } = gamestate
      assert current_player == player2
    end

    test "gamestate can get the current player" do
      board = "foo"
      row_size = 3
      rules = "rules"

      player1 = HumanPlayer.create_player("Player 1", :x)
      player2 = ComputerPlayer.create_player("Computer", :o)

      gamestate = GameState.create_game_state(board, row_size, rules)
      |> GameState.set_first_player(player1)
      |> GameState.set_second_player(player2)

      assert gamestate.current_player == player1
    end

    test "gamestate can get the current player after switching players" do
      board = "foo"
      row_size = 3
      rules = "rules"

      player1 = HumanPlayer.create_player("Player 1", :x)
      player2 = ComputerPlayer.create_player("Computer", :o)

      gamestate = GameState.create_game_state(board, row_size, rules)
      |> GameState.set_first_player(player1)
      |> GameState.set_second_player(player2)
      |> GameState.switch_current_player_in_gamestate

      assert gamestate.current_player == player2
    end
  end
end
