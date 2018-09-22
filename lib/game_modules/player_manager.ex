defmodule PlayerManager do
  @enforce_keys [:name, :icon]
  defstruct [:name, :icon]

  def player_list(player1, player2) do
    [
      player1,
      player2
    ]
  end

end
