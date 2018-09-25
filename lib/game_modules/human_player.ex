defmodule HumanPlayer do
  @enforce_keys [:name, :icon]
  defstruct [:name, :icon]

  def create_player(name, icon, strategy \\ nil) do
    %HumanPlayer{name: name, icon: icon}
  end

  defimpl PlayerMove, for: HumanPlayer do
    def select_move(player, board) do
      4
    end
  end

end
