defmodule GameConfig do
  def init do
    CliMessages.welcome_message
    row_size = GameConfig.row_size
    gamestate = init_gamestate(row_size)

    name = user_input(CliMessages.ask_for_name, IO, UserNameConfig)
    confirm(name, UserNameConfig)

    icon = user_input(CliMessages.ask_for_icon, IO, UserIconConfig)
    confirm(icon, UserIconConfig)

    turn_order = user_input(CliMessages.ask_for_turn_order, IO, UserTurnConfig)
    confirm(turn_order, UserTurnConfig)


    gamestate
  end

  def row_size(row_size \\ 3) do
    row_size
  end

  def init_gamestate(row_size) do
    board = Board.create_board(row_size)
    GameState.create_game_state(board, row_size, Rules)
  end

  def user_input(message, io \\ IO, module) do
    input = get_input(message, io)
    module.validate(input, message, io)
  end

  def confirm(input, module) do
    module.confirm(input)
  end

  def create_user_generated_player(gamestate, name, icon, turn_order) do
    cond do
      turn_order == 1 ->
        "create human player first, then computer player"
      turn_order == 2 ->
        "create computer player first, then human player"
    end
  end

  defp get_input(message, io) do
    io.gets(message)
    |> String.trim
  end
end
