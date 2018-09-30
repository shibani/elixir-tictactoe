defmodule FakeNameIO do
  defdelegate puts(message), to: IO
  def gets("Please enter the name you'd like to play as:\n"), do: "Human Player "
  def gets(value), do: raise ArgumentError, message: "invalid argument #{value}"
end

defmodule FakeIconIO do
  defdelegate puts(message), to: IO
  def gets("\nPlease enter any alpha character as your icon:\n"), do: " X "
  def gets(value), do: raise ArgumentError, message: "invalid argument #{value}"
end

defmodule FakeTurnIO do
  defdelegate puts(message), to: IO
  def gets("\nEnter 1 if you would like to go first or 2 if second:\n"), do: " 1 "
  def gets(value), do: raise ArgumentError, message: "invalid argument #{value}"
end

defmodule FakeMoveIO do
  def gets("\nEnter your move:\n"), do: " 8 "
  def gets(value), do: raise ArgumentError, message: "invalid argument #{value}"

end
