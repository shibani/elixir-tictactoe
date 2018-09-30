defmodule ComputerPlayerConfig do
  def get_name(_message, _io \\ IO) do
    CliMessages.computer_name
  end

  def get_icon(_message, _io \\ IO) do
    CliMessages.computer_icon
  end

  def get_turn_order(message, _io \\ IO) do
    if message == "1", do: "2", else: "1"
  end

  def confirm_name(input) do
    CliMessages.confirm_computer_name <> input
  end

  def confirm_icon(input) do
    CliMessages.confirm_computer_icon <> input
  end

  def confirm_turn_order(input) do
    order = if input == "1", do: "first", else: "second"
    CliMessages.confirm_computer_turn_order <> order
  end
end
