defmodule PlayerConfig do

  def get_name(module, message, io \\ IO) do
    module.get_name(message, io)
  end

  def get_icon(module, message, io \\ IO) do
    module.get_icon(message, io)
  end

  def get_turn_order(module, message, io \\ IO) do
    module.get_turn_order(message, io)
  end

  def confirm_name(module, input) do
    module.confirm_name(input)
  end

  def confirm_icon(module, input) do
    module.confirm_icon(input)
  end

  def confirm_turn_order(module, input) do
    module.confirm_turn_order(input)
  end
end
