defmodule FakeGameConfig do
  def setup do
    "Game setup was called"
  end

  def init(gamesetup) do
    "Game config was called"
  end
end

defmodule FakeGameLoop do
  def init(gamestate) do
    "Game loop was called"
  end
end

defmodule FakeGameOver do
  def init(gamestate) do
    "Game over was called"
  end
end

defmodule FakeNilGameConfig do

  def setup do
    nil
  end
  def init(gameconfig) do
    nil
  end
end

defmodule FakeNilGameLoop do
  def init(gamestate) do
    gamestate
  end
end

defmodule FakeNilGameOver do
  def init(gamestate) do
    gamestate
  end
end
