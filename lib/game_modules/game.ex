defmodule Game do

  def place_move(position, board, icon) do
    position_key = Board.position_to_key_atom(position)
    Map.put(board, position_key, icon)
  end

end
