defmodule ReversePolish do
  @moduledoc """
  Reverse Polish Notation is a notation for simplifying expressions by eliminating the need for brackets.
  """

  @doc """
  Calculates the value of an expression given in Reverse Polish Notation.

  ## Examples

      iex> ReversePolish.calculate("1 1 +")
      2

      iex> ReversePolish.calculate("2 4 * 8 +")
      16

      iex> ReversePolish.calculate("2 4 8 + *")
      24

      iex> ReversePolish.calculate("3 2 * 11 -")
      -5

      iex> ReversePolish.calculate("2 5 * 4 + 3 2 * 1 + /")
      2

      iex> ReversePolish.calculate("3 3 @")
      ** (RuntimeError) Invalid token in expression: '@'

  """
  def calculate(str) do
    String.split(str)
      |> Enum.reduce([], &evaluate_token/2)
      |> List.first
  end

  defp evaluate_token(token, stack) do
    if String.match?(token, ~r/\A\d+\z/) do
      Integer.parse(token)
        |> elem(0)
        |> push_operand(stack)
    else
      apply_operator(token, stack)
    end
  end

  defp push_operand(operand, stack) when is_number(operand) do
    [operand | stack]
  end

  defp apply_operator(operator, [rhs, lhs | stack]) do
    [Operators.evaluate(operator, rhs, lhs) | stack]
  end

end
