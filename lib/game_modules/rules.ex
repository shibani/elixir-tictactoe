defmodule Rules do

  def has_winning_row?(board) do
    check_for_win(Board.rows(board))
  end

  def has_winning_column?(board) do
    check_for_win(Board.columns(board))
  end

  def has_winning_diagonal?(board) do
    check_for_win(Board.diagonals(board))
  end

  def is_winning_row?(row) do
    all_elements_are_equal?(row)
    && no_elements_are_empty?(row)
  end

  def square_to_rows_and_cols(square, row_size) do
    %{
      row: div(square - 1, row_size),
      col: rem(square - 1, row_size)
    }
  end

  defp check_for_win(rows) do
    Enum.any?(rows, fn row -> is_winning_row?(row) end)
  end

  defp all_elements_are_equal?(row) do
    Enum.count(Enum.uniq(row)) == 1
  end

  defp no_elements_are_empty?(row) do
    !Enum.any?(row, &is_nil/1)
  end
end
