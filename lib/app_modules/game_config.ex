defmodule GameConfig do
  def setup(module, io \\ IO, player_config) do

    module.welcome_message

    row_size = GameConfig.row_size

    name = player_config.get_name(HumanPlayerConfig, CliMessages.ask_for_name, io)
    player_config.confirm_name(HumanPlayerConfig, name)

    icon = player_config.get_icon(HumanPlayerConfig, CliMessages.ask_for_icon, io)
    player_config.confirm_icon(HumanPlayerConfig, icon)

    turn_order = player_config.get_turn_order(HumanPlayerConfig, CliMessages.ask_for_turn_order, io)
    player_config.confirm_turn_order(HumanPlayerConfig, turn_order)

    computer_name = player_config.get_name(ComputerPlayerConfig, nil, io)
    player_config.confirm_name(ComputerPlayerConfig, computer_name)

    computer_icon = player_config.get_icon(ComputerPlayerConfig, nil, io)
    player_config.confirm_icon(ComputerPlayerConfig, computer_icon)

    computer_turn_order = player_config.get_turn_order(ComputerPlayerConfig, turn_order, io)
    player_config.confirm_turn_order(ComputerPlayerConfig, computer_turn_order)

    %{}
    |> Map.put(:row_size, row_size)
    |> Map.put(:name, name)
    |> Map.put(:icon, icon)
    |> Map.put(:turn_order, String.to_integer(turn_order))
    |> Map.put(:human_strategy, InputStrategy)
    |> Map.put(:computer_name, computer_name)
    |> Map.put(:computer_icon, computer_icon)
    |> Map.put(:computer_strategy, MinimaxStrategy)
  end

  def init(gamesetup) do
    init_gamestate(gamesetup.row_size)
    |> create_human_player(gamesetup.name, gamesetup.icon, gamesetup.turn_order, gamesetup.human_strategy)
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
    get_input(message, io)
    |> module.validate(message, io)
  end

  def confirm(input, module) do
    module.confirm(input)
  end

  def create_human_player(gamestate, name, icon, turn_order, strategy) do
    human_player = HumanPlayer.create_player(name, icon, strategy)
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
    order = CliMessages.format_computer_turn_order(turn_order)
    IO.puts CliMessages.computer_config(name, icon, order)
  end

  defp get_input(message, io) do
    io.gets(message)
    |> String.trim
  end
end
