defmodule GameState do
  @enforce_keys [:board, :row_size, :player1, :player2, :current_player, :rules]
  defstruct [:board, :row_size, :player1, :player2, :current_player, :rules]

  def create_game_state(board, row_size, rules) do
    %GameState{
      board: board,
      row_size: row_size,
      player1: nil,
      player2: nil,
      current_player: nil,
      rules: rules
    }
  end

  def set_first_player(gamestate, player) do
    gamestate
    |> Map.put(:player1, player)
    |> Map.put(:current_player, player)
  end

  def set_second_player(gamestate, player) do
    Map.put(gamestate, :player2, player)
  end

  def switch_current_player_in_gamestate(gamestate) do
    %{ current_player: current_player, player1: player1, player2: player2 } = gamestate
    cond do
      Map.equal?(current_player, player1) ->
        Map.put(gamestate, :current_player, player2)
      Map.equal?(current_player, player2) ->
        Map.put(gamestate, :current_player, player1)
    end
  end

  def update_board(gamestate, new_board) do
    gamestate
    |> Map.put(:board, new_board)
  end

end
