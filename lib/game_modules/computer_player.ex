defmodule ComputerPlayer do
  @enforce_keys [:name, :icon]
  defstruct [:name, :icon, :strategy]

  def create_player(name, icon, strategy \\ nil) do
    %ComputerPlayer{name: name, icon: icon, strategy: strategy}
  end

  defimpl PlayerMove, for: ComputerPlayer do
    def select_move(player, board) do
      player.strategy.best_move(board)
    end
  end

end
