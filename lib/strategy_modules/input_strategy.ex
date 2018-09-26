defmodule InputStrategy do

  def getInput(io \\ IO) do
    io.gets
    |> String.trim
    |> String.to_integer
  end
end
