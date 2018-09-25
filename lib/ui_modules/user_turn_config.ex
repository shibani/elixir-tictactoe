defmodule UserTurnConfig do
  def validate(input, message, io \\ IO) do
    if String.match?(input, ~r/^[1|2]$/) do
      turn_order_is_valid(input)
    else
      turn_order_is_invalid()
      GameConfig.user_input(message, io, __MODULE__)
    end
  end

  def confirm(order) do
    order_string = order |> Integer.to_string
    IO.puts "Your selected turn order is " <> order_string
  end

  defp turn_order_is_valid(input) do
    input
    |> String.to_integer
  end

  defp turn_order_is_invalid do
    IO.puts CliMessages.invalid_turn_order
  end
end
