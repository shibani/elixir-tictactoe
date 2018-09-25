defmodule FakeGameConfig do
  def init do
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
  def init do
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
