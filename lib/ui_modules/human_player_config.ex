defmodule HumanPlayerConfig do
  def get_name(message, io \\ IO) do
    ask_for_input(message, io)
    |> validate_name(message, io)
  end

  def get_icon(message, io \\ IO) do
    ask_for_input(message, io)
    |> validate_icon(message, io)
  end

  def get_turn_order(message, io \\ IO) do
    ask_for_input(message, io)
    |> validate_turn_order(message, io)
  end

  def ask_for_input(message, io \\ IO) do
    get_input(message, io)
  end

  def validate_name(input, message, io \\ IO) do
    case String.length(input) > 0 do
      true -> input
      false -> name_is_invalid()
      HumanPlayerConfig.get_name(message, io)
    end
  end

  def validate_icon(input, message, io \\ IO) do
    case String.match?(input, ~r/\A[A-Za-z]\z/) do
      true -> input
      false -> icon_is_invalid()
      HumanPlayerConfig.get_icon(message, io)
    end
  end

  def validate_turn_order(input, message, io \\ IO) do
    case String.match?(input, ~r/^[1|2]$/) do
      true -> input
      false -> turn_order_is_invalid()
      HumanPlayerConfig.get_turn_order(message, io)
    end
  end

  def confirm_name(input) do
    CliMessages.confirm_name <> input
  end

  def confirm_icon(input) do
    CliMessages.confirm_icon <> input
  end

  def confirm_turn_order(input) do
    CliMessages.confirm_turn_order <> input
  end

  defp get_input(message, io) do
    io.gets(message)
    |> String.trim
  end

  defp name_is_invalid do
    IO.puts CliMessages.invalid_user_name
  end

  defp icon_is_invalid do
    IO.puts CliMessages.invalid_user_icon
  end

  defp turn_order_is_invalid do
    IO.puts CliMessages.invalid_turn_order
  end
end
