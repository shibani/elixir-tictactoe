defmodule UserIconConfig do
  def validate(input, message, io \\ IO) do
    if String.match?(input, ~r/^[A-Za-z]$/) do
      icon_is_valid(input)
    else
      icon_is_invalid()
      GameConfig.user_input(message, io, __MODULE__)
    end
  end

  def confirm(icon) do
    IO.puts "Your selected user icon is " <> icon
  end

  defp icon_is_valid(input) do
    input
  end

  defp icon_is_invalid do
    IO.puts CliMessages.invalid_user_icon
  end
end
