defmodule Game do

  def mark_square(board, row, column, icon) do
    old_row = Board.get_row_at(board, row)
    new_row = List.replace_at(old_row, column, icon)
    List.replace_at(board, row, new_row)
  end

  def mark_square(gamestate, square) do
    %{ row: row, col: col } =
    Rules.square_to_rows_and_cols(square, gamestate.row_size)
    board = mark_square(gamestate.board, row, col, gamestate.current_player.icon)
    Map.put(gamestate, :board, board)
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
    gamestate
    |> GameState.switch_current_player
  end

  def valid_move?(board, square, row_size) do
    %{row: row, col: col} = Rules.square_to_rows_and_cols(square, row_size)
    square_is_empty?(board, row, col)
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

  defp square_is_empty?(board, row, col) do
    Board.get_square(board, row, col) == nil
  end

end
