defmodule ComputerPlayer do
  @enforce_keys [:name, :icon]
  defstruct [:name, :icon]

  def create_player(name, icon) do
    %ComputerPlayer{name: name, icon: icon}
  end

  defimpl PlayerMove, for: ComputerPlayer do
    def select_move(current_player, board, input \\ nil) do
      nil
    end
  end

end
