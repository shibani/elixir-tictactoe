defmodule Game do

  def mark_square(board, row, column, icon) do
    old_row = Board.get_row_at(board, row)
    new_row = List.replace_at(old_row, column, icon)
    List.replace_at(board, row, new_row)
  end

  def has_win?(board) do
    Board.has_winning_row?(board) ||
    Board.has_winning_column?(board) ||
    Board.has_winning_diagonal?(board)
  end

  def is_tied?(board) do
    Board.is_full?(board) && !Game.has_win?(board)
  end

  def is_over?(board) do
    Board.is_full?(board) || Game.has_win?(board)
  end

  def switch_player(player_list, current_player \\ nil) do
    cond do
      current_player == nil ->
        List.first(player_list)
      Map.equal?(current_player, List.last(player_list)) ->
        List.first(player_list)
      Map.equal?(current_player, List.first(player_list)) ->
        List.last(player_list)
    end
  end

end
