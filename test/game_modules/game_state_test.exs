defmodule GameStateTest do
  use ExUnit.Case

  describe "should create a gamestate with a board, row_size, players, current player and rules" do
    test "gamestate's board, row_size and rules should have initial values when created" do
      board = "foo"
      row_size = 4
      rules = "rules"

      gamestate = GameState.create_game_state(board, row_size, rules)

      % GameState{ board: gs_board, row_size: gs_row_size, players: gs_players,
      current_player: gs_current_player, rules: gs_rules } = gamestate

      assert gs_board == "foo"
      assert gs_row_size == 4
      assert gs_players == []
      assert gs_current_player == nil
      assert gs_rules == "rules"
    end
  end

  describe "update game state with players" do
    test "should update the gamestate when given the first player" do
      board = "foo"
      row_size = 3
      rules = "rules"

      gamestate = GameState.create_game_state(board, row_size, rules)
      player = HumanPlayer.create_player("Player 1", :x)
      new_gamestate = GameState.set_first_player(gamestate, player)

      assert Map.equal?(List.first(new_gamestate.players), player)
      assert Map.equal?(new_gamestate.current_player, player)
    end

    test "should update the gamestate's players list when given the first player" do
      board = "foo"
      row_size = 3
      rules = "rules"

      gamestate = GameState.create_game_state(board, row_size, rules)
      player = HumanPlayer.create_player("Player 1", :x)
      new_gamestate = GameState.set_first_player(gamestate, player)

      assert Map.equal?(List.first(new_gamestate.players), player)
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

      second_player = Enum.at(gamestate.players, 1)

      assert Map.equal?(second_player, player2)
    end

    test "gamestate can switch the current player" do
      board = "foo"
      row_size = 3
      rules = "rules"

      player1 = HumanPlayer.create_player("Player 1", :x, FakeStrategy)
      player2 = ComputerPlayer.create_player("Computer", :o, FakeStrategy)

      gamestate = GameState.create_game_state(board, row_size, rules)
      |> GameState.set_first_player(player1)
      |> GameState.set_second_player(player2)
      |> GameState.switch_current_player

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
      |> GameState.switch_current_player

      assert gamestate.current_player == player2
    end
  end

  describe "update game state with updated board" do
    @row_size 3

    @board1 [
      [:x, :x, :o],
      [:o, :x, :x],
      [:o, :o, :o]
    ]

    @board2 [
      [:x, :x, :o],
      [:o, :x, :x],
      [:x, :o, :o]
    ]

    @gamestate1 %{
      board: @board1,
      row_size: @row_size,
      players: [],
      current_player: nil,
      rules: Rules
    }

    test "given a gamestate and a new board, it can update the board" do
      new_gamestate = GameState.update_board(@gamestate1, @board2)

      stringify_asserted_result = new_gamestate.board |> List.flatten |> Enum.join(", ")
      stringify_expected_result = @board2 |> List.flatten |> Enum.join(", ")

      assert stringify_asserted_result == stringify_expected_result
    end
  end

  describe "it can get the first and second players" do
    test "it can get the first or second player if given a gamestate" do
      player1 = HumanPlayer.create_player("Player 1", :x, FakeStrategy)
      player2 = ComputerPlayer.create_player("Computer", :o, FakeStrategy)

      gamestate = %{
        board: "foo",
        row_size: 3,
        players: [player1, player2],
        current_player: nil,
        rules: Rules
      }

      assert GameState.get_first_player(gamestate) == player1
      assert GameState.get_second_player(gamestate) == player2
    end
  end
end
