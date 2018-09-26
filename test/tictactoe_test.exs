defmodule TicTacToeTest do
  use ExUnit.Case

  describe "init plays the game" do

    test "init can configure the game" do
      assert TicTacToe.init(FakeGameConfig, FakeNilGameLoop, FakeNilGameOver) =~ "Game config was called"
    end

    test "init can play the game loop" do
      assert TicTacToe.init(FakeNilGameConfig, FakeGameLoop, FakeNilGameOver) =~ "Game loop was called"
    end

    test "init calls the game over method" do
      assert TicTacToe.init(FakeNilGameConfig, FakeNilGameLoop, FakeGameOver) =~ "Game over was called"
    end

  end



end
