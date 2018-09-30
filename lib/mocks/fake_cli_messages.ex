defmodule FakeCliMessages do

  def welcome_message, do: nil
  def announce_turn(gamestate), do: nil

  def confirm_move(gamestate, number), do: nil

  def invalid_try_again, do: nil

  def format_board_for_cli(gamestate) do
    gamestate.board
  end

  def game_end, do: "\nThank you for playing!\n"

end
