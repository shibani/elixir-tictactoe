defmodule GameTest do

  use ExUnit.Case
  doctest Game

  @board1 [
    [:x, :x, :o],
    [:o, :x, :x],
    [:x, :o, :o]
  ]

  @board2 [
    [:x, :x, :o],
    [:o, :x, :x],
    [:o, :o, :o]
  ]

  @board3 [
    [:x, :x, nil],
    [:o, nil, :x],
    [:x, :o, :x]
  ]
  describe "game play methods" do
    test "game can mark a square on the board" do
      board = Board.create_board(3)
      updated = Game.mark_square(board, 0, 0, :x)
      assert updated == [[:x, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    end

    test "game has win" do
      assert Game.has_win?(@board2) == true
    end

    test "game does not have win" do
      assert Game.has_win?(@board1) == false
    end

    test "game is not tied if board is not full" do
      assert Game.is_tied?(@board3) == false
    end

    test "game is tied if board is full" do
      assert Game.is_tied?(@board1) == true
    end

    test "board is full but game is not tied because it is won" do
      assert Game.is_tied?(@board2) == false
    end

    test "game is over if board is not full but has a win" do
      board = [
        [:x, :x, :o],
        [:o, :x, nil],
        [nil, :o, :x]
      ]
      assert Game.is_over?(board) == true
    end

    test "game is over if board is full" do
      assert Game.is_over?(@board2) == true
    end

    test "game is not over if board is not full and does not have a win" do
      board = [
        [:x, :x, :o],
        [:o, :x, nil],
        [nil, :o, :o]
      ]
      assert Game.is_over?(board) == false
    end

    test "game is able to switch the current player" do
      board = "foo"
      row_size = 3
      rules = "rules"
      player1 = HumanPlayer.create_player("Player 1", :x)
      player2 = ComputerPlayer.create_player("Computer", :o)

      current_player = GameState.create_game_state(board, row_size, rules)
      |> GameState.set_first_player(player1)
      |> GameState.set_second_player(player2)
      |> Game.switch_player

      assert current_player == player2
    end
  end

  describe "game is able to check if a selected move is valid" do
    test "it can convert a position to rows and columns" do
      square = 6
      row_size = 3
      assert Game.square_to_rows_and_cols(square, row_size) == %{ row: 1, col: 2}
    end

    test "it can convert a map of row and column coordinates back to a position" do
      square = %{row: 1, col: 2}
      row_size = 3
      assert Game.rows_and_cols_to_square(square, row_size) == 6
    end

    test "it can convert row and column coordinates back to a position" do
      row = 1
      col = 2
      row_size = 3
      assert Game.rows_and_cols_to_square(row, col, row_size) == 6
    end

    test "it can check if a move is valid" do
      row_size = 3
      assert Game.valid_move?(@board3, 5, row_size) == true
      assert Game.valid_move?(@board3, 6, row_size) == false
    end

    test "it can get the winning icon" do
      assert Game.winning_icon(@board2) == :o
    end
  end

end
