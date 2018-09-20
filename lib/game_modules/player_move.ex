defprotocol PlayerMove do
  def select_move(board, current_player, input \\ nil)
end
