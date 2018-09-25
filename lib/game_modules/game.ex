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

  def switch_player(gamestate) do
    new_gamestate = gamestate
    |> GameState.switch_current_player_in_gamestate
    new_gamestate.current_player
  end

  def square_to_rows_and_cols(square, row_size) do
    %{
      row: div(square - 1, row_size),
      col: rem(square - 1, row_size)
    }
  end

  def rows_and_cols_to_square(square, row_size) do
    %{row: row, col: col} = square
    row * row_size + col + 1
  end

  def rows_and_cols_to_square(row, col, row_size) do
    row * row_size + col + 1
  end

  def valid_move?(board, square, row_size) do
    %{row: row, col: col} = Game.square_to_rows_and_cols(square, row_size)
    Board.get_square(board, row, col) == nil
  end

  def winning_icon(board) do
    if Game.has_win?(board) do
      cond do
        Rules.has_winning_row?(board) ->
          Board.rows(board)
          |> get_icon
        Rules.has_winning_column?(board) ->
          Board.columns(board)
          |> get_icon
        Rules.has_winning_diagonal?(board) ->
          Board.diagonals(board)
          |> get_icon
      end
    end
  end

  defp get_icon(rows) do
    rows
    |> Enum.filter(&Rules.is_winning_row?/1)
    |> List.flatten
    |> List.first
  end

end
