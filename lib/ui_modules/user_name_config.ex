defmodule UserNameConfig do
  def validate(input, message, io \\ IO) do
    if String.length(input) > 0 do
      name_is_valid(input)
    else
      name_is_invalid()
      GameConfig.user_input(message, io, __MODULE__)
    end
  end

  def confirm(name) do
    IO.puts "Your selected user name is " <> name <> "\n"
  end

  defp name_is_valid(input) do
    input
  end

  defp name_is_invalid do
    IO.puts CliMessages.invalid_user_name
  end
end
