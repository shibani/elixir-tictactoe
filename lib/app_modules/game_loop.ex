defmodule GameLoop do

  def init(gamestate, module) do
    gamestate
    |> module.format_board_for_cli

    move = get_move(gamestate, module)
    IO.puts module.confirm_move(gamestate, move)

    check_for_validity_and_place_move(gamestate, move, module)
    |> check_if_game_is_over_or_loop_again
  end

  def get_move(gamestate, module) do
    IO.puts module.announce_turn(gamestate)
    PlayerMove.select_move(gamestate.current_player, gamestate)
  end

  def check_for_validity_and_place_move(gamestate, move, module) do
    case Game.valid_move?(gamestate.board, move, gamestate.row_size) do
      true -> Game.mark_square(gamestate, move)
      |> Game.switch_player
      false -> IO.puts module.invalid_try_again
      GameLoop.init(gamestate, CliMessages)
    end
  end

  def check_if_game_is_over_or_loop_again(gamestate) do
    case Game.is_over?(gamestate.board) do
      true -> gamestate
      false -> GameLoop.init(gamestate, CliMessages)
    end
  end

end
