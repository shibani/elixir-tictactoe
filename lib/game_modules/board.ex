defmodule Board do

  @player_icons ["X", "O"]

  def create_board(row_size) do
    1..row_size * row_size
    |> Enum.to_list
    |> Map.new(fn position_on_board -> {position_to_key_atom(position_on_board), position_on_board } end)
  end

  def valid_move?(board, position) do
    position_key = position_to_key_atom(position)
    {_, value_at_position} = Map.fetch(board, position_key)
    value_at_position not in @player_icons
  end

  def winning_combinations(row_size) do
    row_wins = row_winning_combinations(row_size)
    column_wins = column_winning_combinations(row_size)
    left_diagonal_win = left_diagonal_winning_combination(row_size)
    right_diagonal_win = right_diagonal_winning_combination(row_size)
    row_wins ++ column_wins ++ left_diagonal_win ++ right_diagonal_win
  end

  def position_to_key_atom(position) do
    position
    |> Integer.to_string()
    |> String.to_atom()
  end

  def key_atom_to_position(key_atom) do
    key_atom
    |> Atom.to_string()
    |> String.to_integer()
  end

  defp row_winning_combinations(row_size) do
    1..row_size * row_size
    |> Enum.chunk(row_size)
  end

  defp column_winning_combinations(row_size) do
    1..row_size
    |> Enum.map(fn column_header -> [column_header, column_header + row_size, column_header + 2 * row_size] end)
  end

  defp left_diagonal_winning_combination(row_size) do
    left_endpoint = 1
    [[left_endpoint, (left_endpoint + row_size + 1), (left_endpoint + 2 * row_size + 2)]]
  end

  defp right_diagonal_winning_combination(row_size) do
    right_endpoint = row_size
    [[right_endpoint, (right_endpoint + row_size - 1), (right_endpoint + 2 * row_size - 2)]]
  end
end
