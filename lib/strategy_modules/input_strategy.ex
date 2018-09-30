defmodule InputStrategy do

  def get_input(io \\ IO) do
    io.gets(CliMessages.input_strategy_move)
    |> String.trim
    |> validate(GameConfig.row_size, io)
  end

  def validate(input, row_size, io \\ IO) do
    case input_is_numeric_string(input) && input_is_within_board_limits(input, row_size) do
      true -> String.to_integer(input)
      false -> input_is_invalid()
      get_input(io)
    end
  end

  defp input_is_invalid do
    IO.puts CliMessages.invalid_try_again
  end

  defp input_is_numeric_string(input) do
    String.match?(input, ~r/[0-9]+/)
  end

  defp input_is_within_board_limits(input, row_size) do
    String.to_integer(input) in 1..(row_size * row_size)
  end
end
