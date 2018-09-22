defmodule GameState do
  @enforce_keys [:board, :player1, :player2, :current_player]
  defstruct [:board, :player1, :player2, :current_player, :rules]

  def create_game_state(board, player1, player2, rules) do
    %GameState{
      board: board,
      player1: player1,
      player2: player2,
      current_player: nil,
      rules: rules
    }
  end

  def create_game_state(board, player1, player2) do
    %GameState{
      board: board,
      player1: player1,
      player2: player2,
      current_player: nil,
      rules: nil
    }
  end

  def create_game_state(board) do
    %GameState{
      board: board,
      player1: nil,
      player2: nil,
      current_player: nil,
      rules: nil
    }
  end
end
