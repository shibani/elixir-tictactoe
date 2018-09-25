defmodule GameLoop do
  @row_size 3

  @board1 [
    [:x, :x, :o],
    [:o, :x, :x],
    [:o, :o, :o]
  ]

  @human_player %HumanPlayer{name: "Player1", icon: :x}
  @computer_player %ComputerPlayer{name: "Computer", icon: :o, strategy: FakeStrategy}

  @gamestate1 %{
    board: @board1,
    row_size: @row_size,
    player1: @human_player,
    player2: @computer_player,
    current_player: nil,
    rules: Rules
  }
  def init(gamestate) do
    IO.puts "gameloop was called"
    CliMessages.format_board_for_cli(@gamestate1.board, @gamestate1.row_size)
    @gamestate1
  end

end
