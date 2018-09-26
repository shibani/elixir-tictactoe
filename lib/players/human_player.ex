defmodule HumanPlayer do
  @enforce_keys [:name, :icon]
  defstruct [:name, :icon, :strategy]

  def create_player(name, icon, strategy \\ nil) do
    %HumanPlayer{name: name, icon: icon, strategy: strategy}
  end

  defimpl PlayerMove, for: HumanPlayer do
    def select_move(player, gamestate) do
      player.strategy.get_input( CliMessages.get_player_move, IO )
    end
  end

end
