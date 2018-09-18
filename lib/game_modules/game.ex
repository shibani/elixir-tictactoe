defmodule Game do

  def place_move(position, board, icon) do
    position_key = Board.position_to_key_atom(position)
    Map.put(board, position_key, icon)
  end

  def won?(board, row_size) do
    win_combinations = Board.winning_combinations(row_size)
    result = for combo <- win_combinations, do: combo
    |> Enum.map(fn(x) ->  board[Board.position_to_key_atom(x)] end)
    |> Enum.uniq
    |> Enum.count()
    IO.inspect result
  end

end
