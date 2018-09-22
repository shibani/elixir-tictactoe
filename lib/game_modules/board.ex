defmodule Board do
  def create_board(row_size) do
    nil
    |> List.duplicate(row_size)
    |> List.duplicate(row_size)
  end

  def columns(board) do
    board
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def rows(board) do
    board
  end

  def diagonals(board) do
    [
      get_diagonal(board),
      get_diagonal(Enum.reverse(board))
    ]
  end

  def get_row_at(board, row) do
    Enum.at(rows(board), row)
  end

  def get_col_at(board, col) do
    Enum.at(columns(board), col)
  end

  def get_square(board, row, col) do
    row = Board.get_row_at(board, row)
    Enum.at(row, col)
  end

  def is_full?(board) do
    board
    |> List.flatten
    |> Enum.all?(fn x -> x != nil end)
  end

  defp get_diagonal(board) do
    board
    |> Enum.with_index
    |> Enum.map(fn {row, idx} -> Enum.at(row, idx) end)
  end
end
