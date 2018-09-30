defmodule FakePlayerConfig do

  def get_name(_module, _message, _io \\ IO) do
    "foo"
  end

  def confirm_name(_module, _input) do
    nil
  end

  def get_icon(_module, _message, _io \\ IO) do
    "X"
  end

  def confirm_icon(_module, _input) do
    nil
  end

  def get_turn_order(_module, _message, _io \\ IO) do
    "1"
  end

  def confirm_turn_order(_module, _input) do
    nil
  end

end
