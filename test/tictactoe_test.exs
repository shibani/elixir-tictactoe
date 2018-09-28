defmodule TicTacToeTest do
  use ExUnit.Case

  describe "init plays the game" do

    test "init can configure the game" do
      assert TicTacToe.init(FakeGameConfig, FakeNilGameLoop, FakeNilGameOver, FakeCliMessages) =~ "Game config was called"
    end

    test "init can play the game loop" do
      assert TicTacToe.init(FakeNilGameConfig, FakeGameLoop, FakeNilGameOver, FakeCliMessages) =~ "Game loop was called"
    end

  end



end
