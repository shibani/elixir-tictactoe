defmodule InputStrategy do

  @input_strategy_move "\nEnter your move:\n"
  @invalid_try_again "\nThat is an invalid move, please try again.\n"

  def get_input(io \\ IO, gamestate) do
    io.gets(@input_strategy_move)
    |> String.trim
    |> validate(gamestate, io)
  end

  def validate(input, gamestate, io \\ IO) do
    case input_is_numeric_string(input) && input_is_within_board_limits(input, gamestate) do
      true -> String.to_integer(input)
      false -> input_is_invalid()
      get_input(io, gamestate)
    end
  end

  defp input_is_invalid do
    IO.puts @invalid_try_again
  end

  defp input_is_numeric_string(input) do
    String.match?(input, ~r/[0-9]+/)
  end

  defp input_is_within_board_limits(input, gamestate) do
    String.to_integer(input) in 1..(gamestate.row_size * gamestate.row_size)
  end
end
