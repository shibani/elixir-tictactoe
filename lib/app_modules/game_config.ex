defmodule GameConfig do
  def setup(module, io \\ IO) do

    module.welcome_message

    row_size = GameConfig.row_size

    name = PlayerConfig.get_name(HumanPlayer, CliMessages.ask_for_name, IO)
    PlayerConfig.confirm_name(HumanPlayer, name)

    icon = PlayerConfig.get_icon(HumanPlayer, CliMessages.ask_for_icon, IO)
    PlayerConfig.confirm_icon(HumanPlayer, icon)

    turn_order = PlayerConfig.get_turn_order(HumanPlayer, CliMessages.ask_for_turn_order, IO)
    PlayerConfig.confirm_turn_order(HumanPlayer, turn_order)

    computer_name = PlayerConfig.get_name(ComputerPlayer, nil, IO)
    PlayerConfig.confirm_name(ComputerPlayer, computer_name)

    computer_icon = PlayerConfig.get_icon(ComputerPlayer, nil, IO)
    PlayerConfig.confirm_icon(ComputerPlayer, computer_icon)

    computer_turn_order = PlayerConfig.get_turn_order(ComputerPlayer, turn_order, IO)
    PlayerConfig.confirm_turn_order(ComputerPlayer, computer_turn_order)

    gamesetup = %{
      row_size: row_size,
      name: name,
      icon: icon,
      turn_order: String.to_integer(turn_order),
      human_strategy: InputStrategy,
      computer_name: module.computer_name,
      computer_icon: module.computer_icon,
      computer_strategy: MinimaxStrategy
    }
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
    order = if (turn_order == 1), do: "second", else: "first"
    IO.puts "\n" <> name <> " chooses to use the icon: " <> icon <> " and will go " <> order <> ".\n"
  end

  defp get_input(message, io) do
    io.gets(message)
    |> String.trim
  end
end
