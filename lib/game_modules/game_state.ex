defmodule GameState do
  @enforce_keys [:board, :row_size, :players, :current_player, :rules]
  defstruct [:board, :row_size, :players, :current_player, :rules]

  def create_game_state(board, row_size, rules) do
    %GameState{
      board: board,
      row_size: row_size,
      players: [],
      current_player: nil,
      rules: rules
    }
  end

  def set_first_player(gamestate, player) do
    player_list = create_or_update_list_with_first_player(gamestate, player)

    gamestate
    |> Map.put(:players, player_list)
    |> set_current_player(player)
  end

  def set_second_player(gamestate, player) do
    player_list = create_or_update_list_with_second_player(gamestate, player)

    Map.put(gamestate, :players, player_list)
  end

  def switch_current_player(gamestate) do
    %{ current_player: current_player} = gamestate
    player1 = get_first_player(gamestate)
    player2 = get_second_player(gamestate)
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

  defp set_current_player(gamestate, player) do
    Map.put(gamestate, :current_player, player)
  end

  def get_first_player(gamestate) do
    List.first(gamestate.players)
  end

  def get_second_player(gamestate) do
    List.last(gamestate.players)
  end

  defp create_or_update_list_with_first_player(gamestate, player) do
    if length(gamestate.players) == 0, do: [player], else: List.replace_at(gamestate.players, 0, player)
  end

  defp create_or_update_list_with_second_player(gamestate, player) do
    if length(gamestate.players) == 0, do: [nil, player], else: List.insert_at(gamestate.players, 1, player)
  end

end
