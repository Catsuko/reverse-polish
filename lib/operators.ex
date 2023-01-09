defmodule Operators do
  @moduledoc """
  Operators accept two numbers and combine them to produce a result.
  """

  def evaluate("+", rhs, lhs) do
    lhs + rhs
  end

  def evaluate("-", rhs, lhs) do
    lhs - rhs
  end

  def evaluate("*", rhs, lhs) do
    lhs * rhs
  end

  def evaluate("/", rhs, lhs) do
    trunc(lhs / rhs)
  end

  def evaluate(unknown_operator, _rhs, _lhs) do
    raise "Invalid token in expression: '#{unknown_operator}'"
  end

end
