defmodule ReversePolish.Operators do
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

  def evaluate("^", rhs, lhs) do
    Integer.pow(lhs, rhs)
  end

  def evaluate("%", rhs, lhs) do
    Integer.mod(lhs, rhs)
  end

  def evaluate("min", rhs, lhs) do
    min(rhs, lhs)
  end

  def evaluate("max", rhs, lhs) do
    max(rhs, lhs)
  end

  def evaluate(unknown_operator, _rhs, _lhs) do
    raise "Invalid token in expression: '#{unknown_operator}'"
  end

end
