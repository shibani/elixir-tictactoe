defmodule CliMessages do

  @welcome_message "\nWelcome to Tictactoe, human vs computer version\n"
  @ask_for_name "Please enter the name you'd like to play as:\n"
  @ask_for_icon "\nPlease enter any alpha character as your icon:\n"
  @ask_for_turn_order "\nEnter 1 if you would like to go first or 2 if second:\n"
  @confirm_name "Your selected player name is "
  @confirm_icon "Your selected icon is "
  @confirm_turn_order "Your selected turn order is "
  @invalid_user_name "\nName should not be empty, please try again\n"
  @invalid_user_icon "\nThat was an invalid selection. Icon should be one alpha character. Please try again.\n"
  @invalid_turn_order "\nThat was an invalid selection. Please enter 1 if you would like to go first or 2 if second.\n"
  @row_divider "|\n-------------\n"
  @computer_name "Computer"
  @computer_icon "@"
  @confirm_computer_name "Computer's name will be "
  @confirm_computer_icon "Computer's icon will be "
  @confirm_computer_turn_order "Computer will go "
  @announce_turn ", your turn. Please select a move between 1 - 9:"
  # @input_strategy_move "\nEnter your move:\n"
  # @invalid_try_again "\nThat is an invalid move, please try again.\n"
  @game_tied "\nGame is tied!"
  @game_end "\nThank you for playing!\n"

  def welcome_message, do: IO.puts @welcome_message

  def ask_for_name, do: @ask_for_name

  def ask_for_icon, do: @ask_for_icon

  def ask_for_turn_order, do: @ask_for_turn_order

  def confirm_name, do: @confirm_name

  def confirm_icon, do: @confirm_icon

  def confirm_turn_order, do: @confirm_turn_order

  def invalid_user_name, do: @invalid_user_name

  def invalid_user_icon, do: @invalid_user_icon

  def invalid_turn_order, do: @invalid_turn_order

  def computer_name, do: @computer_name

  def computer_icon, do: @computer_icon

  def confirm_computer_name, do: @confirm_computer_name

  def confirm_computer_icon, do: @confirm_computer_icon

  def confirm_computer_turn_order, do: @confirm_computer_turn_order

  def format_computer_turn_order(turn_order) do
    if (turn_order == 1), do: "second", else: "first"
  end

  def computer_config(name, icon, order) do
    "\n" <> name <> " chooses to use the icon: " <> icon <> " and will go " <> order <> ".\n"
  end

  def announce_turn(gamestate), do: gamestate.current_player.name <> @announce_turn

  def confirm_move(gamestate, number), do: "\n" <> gamestate.current_player.name <> " selects square " <> Integer.to_string(number) <> ". Placing " <> gamestate.current_player.name <> "\'s move.\n"

  def game_tied, do: @game_tied

  def game_won(name), do: "\n" <> name <> " wins!"

  def game_end, do: @game_end

  def format_board_for_cli(gamestate) do
    gamestate.board
    |> List.flatten
    |> Enum.with_index(1)
    |> Enum.map(fn {k, v} -> if k != nil, do: "| " <> Kernel.to_string(k)  <> " ", else: "| " <> Integer.to_string(v) <> " " end)
    |> Enum.chunk(gamestate.row_size)
    |> Enum.map(fn x -> Enum.join(x) end)
    |> Enum.join(@row_divider)
    |> (&<>/2).("|\n")
    |> IO.puts
  end

end
