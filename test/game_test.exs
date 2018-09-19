defmodule GameTest do

  use ExUnit.Case
  doctest Game

  test "game can mark a square on the board" do
    board = MatrixBoard.create_board(3)
    updated = Game.mark_square(board, 0, 0, :x)
    assert updated == [[:x, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  test "game has win" do
    board = [
      [:x, :o, :x],
      [:o, :x, :x],
      [:o, :o, :o]
    ]
    assert Game.has_win?(board) == true
  end

  test "game does not have win" do
    board = [
      [:x, :x, :o],
      [:o, :o, :x],
      [:x, :o, :x]
    ]
    assert Game.has_win?(board) == false
  end

  test "game is not tied" do
    board = [
      [:x, :x, nil],
      [:o, nil, :x],
      [:x, :o, :x]
    ]
    assert Game.is_tied?(board) == false
  end

  test "game is tied" do
    board = [
      [:x, :x, :o],
      [:o, :x, :x],
      [:x, :o, :o]
    ]
    assert Game.is_tied?(board) == true
  end

  test "game is full but not tied because it is won" do
    board = [
      [:x, :x, :o],
      [:o, :x, :x],
      [:o, :o, :o]
    ]
    assert Game.is_tied?(board) == false
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
    board = [
      [:x, :x, :o],
      [:o, :x, :x],
      [:o, :o, :o]
    ]
    assert Game.is_over?(board) == true
  end

  test "game is not over if board is not full and does not have a win" do
    board = [
      [:x, :x, :o],
      [:o, :x, nil],
      [nil, :o, :o]
    ]
    assert Game.is_over?(board) == false
  end

  test "game is able to set the current player if this is a new game and there is no current player yet" do
    player = nil
    player1 = Player.create_player(:x, "human")
    player2 = Player.create_player(:o, "computer")
    player_list = Player.player_list(player1, player2)
    current_player = Game.switch_player(player_list, player)

    assert Map.equal?(current_player, player1)
  end

  test "game is able to set the current player" do
    player1 = Player.create_player(:x, "human")
    player2 = Player.create_player(:o, "computer")
    player_list = Player.player_list(player1, player2)
    current_player = Game.switch_player(player_list, player1)

    assert Map.equal?(current_player, player2)
  end
end
