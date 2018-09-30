defmodule FakePlayerConfig do

  def get_name(module, message, io \\ IO) do
    "foo"
  end

  def confirm_name(module, input) do
    nil
  end

  def get_icon(module, message, io \\ IO) do
    "X"
  end

  def confirm_icon(module, input) do
    nil
  end

  def get_turn_order(module, message, io \\ IO) do
    "1"
  end

  def confirm_turn_order(module, input) do
    nil
  end

end
