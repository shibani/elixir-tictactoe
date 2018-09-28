defmodule FakeGameConfig do
  def setup(module) do
    "Game setup was called"
  end

  def init(gamesetup) do
    "Game config was called"
  end
end

defmodule FakeGameLoop do
  def init(gamestate, module) do
    "Game loop was called"
  end
end

defmodule FakeGameOver do
  def init(gamestate, module) do
    "Game over was called"
  end
end

defmodule FakeNilGameConfig do

  def setup(module) do
    nil
  end
  def init(gameconfig) do
    nil
  end
end

defmodule FakeNilGameLoop do
  def init(gamestate, module) do
    gamestate
  end
end

defmodule FakeNilGameOver do
  def init(gamestate, module) do
    gamestate
  end
end
