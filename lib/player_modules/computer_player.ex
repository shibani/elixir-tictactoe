defmodule ComputerPlayer do
  @enforce_keys [:name, :icon]
  defstruct [:name, :icon, :strategy]

  def create_player(name, icon, strategy \\ nil) do
    %ComputerPlayer{name: name, icon: icon, strategy: strategy}
  end

  defimpl PlayerMove, for: ComputerPlayer do
    def select_move(player, gamestate) do
      player.strategy.best_move(gamestate)
    end
  end

  def get_name(message, io \\ IO) do
    CliMessages.computer_name
  end

  def get_icon(message, io \\ IO) do
    CliMessages.computer_icon
  end

  def get_turn_order(message, io \\ IO) do
    if message == "1", do: "2", else: "1"
  end

  def confirm_name(input) do
    "Computer's name will be " <> input
  end

  def confirm_icon(input) do
    "Computer's icon will be " <> input
  end

  def confirm_turn_order(input) do
    order = if input == "1", do: "first", else: "second"
    "Computer will go " <> order
  end

end
