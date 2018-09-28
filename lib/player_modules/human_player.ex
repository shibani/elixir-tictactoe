defmodule HumanPlayer do
  @enforce_keys [:name, :icon]
  defstruct [:name, :icon, :strategy]

  def create_player(name, icon, strategy \\ nil) do
    %HumanPlayer{name: name, icon: icon, strategy: strategy}
  end

  defimpl PlayerMove, for: HumanPlayer do
    def select_move(player, gamestate) do
      player.strategy.get_input(IO)
    end
  end

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
    if String.length(input) > 0 do
      input
    else
      name_is_invalid()
      HumanPlayer.ask_for_input(message, io)
    end
  end

  @spec validate_icon(binary(), any(), any()) :: binary()
  def validate_icon(input, message, io \\ IO) do
    if String.match?(input, ~r/^[A-Za-z]$/) do
      input
    else
      icon_is_invalid()
      HumanPlayer.ask_for_input(message, io)
    end
  end

  def validate_turn_order(input, message, io \\ IO) do
    if String.match?(input, ~r/^[1|2]$/) do
      input
    else
      turn_order_is_invalid()
      HumanPlayer.ask_for_input(message, io)
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
