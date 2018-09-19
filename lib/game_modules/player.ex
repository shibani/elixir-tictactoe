defmodule Player do

  def create_player(icon, type) do
    %{icon: icon, type: type}
  end

  def player_list(player1, player2) do
    [
      player1,
      player2
    ]
  end

end
