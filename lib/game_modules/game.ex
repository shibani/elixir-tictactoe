defmodule Game do

  def mark_square(board, row, column, icon) do
    old_row = Board.get_row_at(board, row)
    new_row = List.replace_at(old_row, column, icon)
    List.replace_at(board, row, new_row)
  end

  def has_win?(board) do
    Rules.has_winning_row?(board) ||
    Rules.has_winning_column?(board) ||
    Rules.has_winning_diagonal?(board)
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

  def square_to_rows_and_cols(square, row_size) do
    [
      div(square - 1, row_size),
      rem(square - 1, row_size)
    ]
  end

  def rows_and_cols_to_square(row, col, row_size) do
    row * row_size + col + 1
  end

  def valid_move?(board, square, row_size) do
    [first, last] = Game.square_to_rows_and_cols(square, row_size)
    Board.get_square(board, first, last) == nil
  end

end
