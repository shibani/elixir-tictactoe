defmodule InputStrategy do

  def get_input(io \\ IO) do
    io.gets("\nEnter your move:\n")
    |> String.trim
    |> String.to_integer
    |> validate(GameConfig.row_size, io)
  end

  def validate(input, row_size, io \\ IO) do
    if input >= 1 && input <= row_size * row_size do
      input_is_valid(input)
    else
      input_is_invalid()
      get_input(io)
    end
  end

  defp input_is_valid(input) do
    input
  end

  defp input_is_invalid do
    IO.puts CliMessages.invalid_try_again
  end
end
