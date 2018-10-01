defmodule ComputerPlayerConfigTest do
  use ExUnit.Case

  test "it should set a name" do
    message = ""
    assert ComputerPlayerConfig.get_name(message, IO) == "Computer"
  end

  test "it should set an icon" do
    message = ""
    assert ComputerPlayerConfig.get_icon(message, IO) == "@"
  end

  test "it should set a turn order" do
    message = "2"
    assert ComputerPlayerConfig.get_turn_order(message, IO) == "1"
  end

  test "it should confirm the computer's player name" do
    input = "Computer"
    assert ComputerPlayerConfig.confirm_name(input) == "Computer's name will be Computer"
  end

  test "it should confirm the computer's icon" do
    input = "@"
    assert ComputerPlayerConfig.confirm_icon(input) == "Computer's icon will be @"
  end

  test "it should confirm the computer's turn order" do
    input = "1"
    assert ComputerPlayerConfig.confirm_turn_order(input) == "Computer will go first"
  end
end
