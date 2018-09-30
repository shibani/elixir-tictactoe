defmodule FakeGameConfig do
  def setup(_module, _player_config) do
    "Game setup was called"
  end

  def init(_gamesetup) do
    "Game config was called"
  end
end

defmodule FakeGameLoop do
  def init(_gamestate, _module) do
    "Game loop was called"
  end
end

defmodule FakeGameOver do
  def init(_gamestate, _module) do
    "Game over was called"
  end
end

defmodule FakeNilGameConfig do

  def setup(_module, _player_config) do
    nil
  end
  def init(_gameconfig) do
    nil
  end
end

defmodule FakeNilGameLoop do
  def init(gamestate, _module) do
    gamestate
  end
end

defmodule FakeNilGameOver do
  def init(gamestate, _module) do
    gamestate
  end
end
