defmodule GameConfig do
  def setup do
    CliMessages.welcome_message

    row_size = GameConfig.row_size

    name = user_input(CliMessages.ask_for_name, IO, UserNameConfig)
    confirm(name, UserNameConfig)

    icon = user_input(CliMessages.ask_for_icon, IO, UserIconConfig)
    confirm(icon, UserIconConfig)

    turn_order = user_input(CliMessages.ask_for_turn_order, IO, UserTurnConfig)
    confirm(turn_order, UserTurnConfig)

    computer_player_config_message(CliMessages.computer_name, CliMessages.computer_icon, turn_order)

    gamesetup = %{
      row_size: row_size,
      name: name,
      icon: icon,
      turn_order: turn_order,
      computer_name: CliMessages.computer_name,
      computer_icon: CliMessages.computer_icon,
      computer_strategy: MinimaxStrategy
    }
  end

  def init(gamesetup) do
    init_gamestate(gamesetup.row_size)
    |> create_human_player(gamesetup.name, gamesetup.icon, gamesetup.turn_order)
    |> create_computer_player(gamesetup.computer_name, gamesetup.computer_icon, gamesetup.turn_order, gamesetup.computer_strategy)
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

  def create_human_player(gamestate, name, icon, turn_order) do
    human_player = HumanPlayer.create_player(name, icon)
    new_gamestate = cond do
      turn_order == 1 ->
        gamestate
        |> GameState.set_first_player(human_player)
      turn_order == 2 ->
        gamestate
        |> GameState.set_second_player(human_player)
    end
    new_gamestate
  end

  def create_computer_player(gamestate, name, icon, turn_order, strategy) do
    computer_player = ComputerPlayer.create_player(name, icon, strategy)
    new_gamestate = cond do
      turn_order == 1 ->
        gamestate
        |> GameState.set_second_player(computer_player)
      turn_order == 2 ->
        gamestate
        |> GameState.set_first_player(computer_player)
    end
    new_gamestate
  end

  def computer_player_config_message(name, icon, turn_order) do
    order = if (turn_order == 1), do: "second", else: "first"
    IO.puts "\n" <> name <> " chooses to use the icon: " <> icon <> " and will go " <> order <> ".\n"
  end

  defp get_input(message, io) do
    io.gets(message)
    |> String.trim
  end
end
