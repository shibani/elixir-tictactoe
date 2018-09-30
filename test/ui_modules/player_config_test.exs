defmodule PlayerConfigTest do
  use ExUnit.Case

  test "it should return a human player name" do
    message = "Please enter the name you'd like to play as:\n"
    assert PlayerConfig.get_name(HumanPlayerConfig, message, FakeNameIO) == "Human Player"
  end

  test "it should return a computer player name" do
    message = ""
    assert PlayerConfig.get_name(ComputerPlayerConfig, message, IO) == "Computer"
  end

  test "it should return an icon" do
    message = "\nPlease enter any alpha character as your icon:\n"
    assert PlayerConfig.get_icon(HumanPlayerConfig, message, FakeIconIO) == "X"
  end

  test "it should return a computer icon" do
    message = "\nPlease enter any alpha character as your icon:\n"
    assert PlayerConfig.get_icon(ComputerPlayerConfig, message, IO) == "@"
  end

  test "it should return a turn_order" do
    message = "\nEnter 1 if you would like to go first or 2 if second:\n"
    assert PlayerConfig.get_turn_order(HumanPlayerConfig, message, FakeTurnIO) == "1"
  end

  test "it should return a computer turn_order, depending on the player's turn order" do
    message = "1"
    assert PlayerConfig.get_turn_order(ComputerPlayerConfig, message, IO) == "2"
  end

  test "it should confirm the player name" do
    assert PlayerConfig.confirm_name(HumanPlayerConfig, "foo") == "Your selected player name is foo"
  end

  test "it should confirm the computer's player name" do
    assert PlayerConfig.confirm_name(ComputerPlayerConfig, "Computer") == "Computer's name will be Computer"
  end

  test "it should confirm the player icon" do
    assert PlayerConfig.confirm_icon(HumanPlayerConfig, "X") == "Your selected icon is X"
  end

  test "it should confirm the computer's player icon" do
    assert PlayerConfig.confirm_icon(ComputerPlayerConfig, "@") == "Computer's icon will be @"
  end

  test "it should confirm the player's turn order" do
    assert PlayerConfig.confirm_turn_order(HumanPlayerConfig, "1") == "Your selected turn order is 1"
  end

  test "it should confirm the computer's turn order" do
    assert PlayerConfig.confirm_turn_order(ComputerPlayerConfig, "2") == "Computer will go second"
  end
end
