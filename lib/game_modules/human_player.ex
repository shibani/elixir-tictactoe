defmodule HumanPlayer do
  @enforce_keys [:name, :icon]
  defstruct [:name, :icon]

  def create_player(name, icon) do
    %HumanPlayer{name: name, icon: icon}
  end

  defimpl PlayerMove, for: HumanPlayer do
    def select_move(current_player, board, input \\ nil) do
      input
    end
  end

end
