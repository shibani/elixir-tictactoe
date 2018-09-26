defmodule CliMessages do

  @welcome_message "\nWelcome to Tictactoe, human vs computer version\n"
  @ask_for_name "Please enter the name you'd like to play as:\n"
  @ask_for_icon "\nPlease enter any alpha character as your icon:\n"
  @ask_for_turn_order "\nEnter 1 if you would like to go first or 2 if second:\n"
  @invalid_user_name "\nName should not be empty, please try again\n"
  @invalid_user_icon "\nThat was an invalid selection. Icon should be one alpha character. Please try again.\n"
  @invalid_turn_order "\nThat was an invalid selection. Please enter 1 if you would like to go first or 2 if second.\n"
  @row_divider "|\n-------------\n"
  @computer_name "Computer"
  @computer_icon "@"
  @get_player_move "\nPlease enter a move:\n"
  @game_tied "\nGame is tied!\n"
  @game_end "\nThank you for playing!\n"

  def welcome_message, do: IO.puts @welcome_message

  def ask_for_name, do: @ask_for_name

  def ask_for_icon, do: @ask_for_icon

  def ask_for_turn_order, do: @ask_for_turn_order

  def invalid_user_name, do: @invalid_user_name

  def invalid_user_icon, do: @invalid_user_icon

  def invalid_turn_order, do: @invalid_turn_order

  def computer_name, do: @computer_name

  def computer_icon, do: @computer_icon

  def get_player_move, do: @get_player_move

  def game_tied, do: @game_tied

  def game_end, do: @game_end

  def format_board_for_cli(board, row_size) do
    board
    |> List.flatten
    |> Enum.with_index(1)
    |> Enum.map(fn {k, v} -> if k != nil, do: "| " <> Atom.to_string(k) <> " ", else: "| " <> Integer.to_string(v) <> " " end)
    |> Enum.chunk(row_size)
    |> Enum.map(fn x -> Enum.join(x) end)
    |> Enum.join(@row_divider)
    |> (&<>/2).("|\n")
    |> IO.puts
  end

end
