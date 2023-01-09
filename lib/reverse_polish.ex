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
      |> Enum.reduce([], fn item, stack -> calculate(item, stack) end)
      |> List.first
  end

  defp calculate("+", [first, second | stack]) do
    [first + second | stack]
  end

  defp calculate("-", [first, second | stack]) do
    [second - first | stack]
  end

  defp calculate("*", [first, second | stack]) do
    [first * second | stack]
  end

  defp calculate("/", [first, second | stack]) do
    [trunc(second / first) | stack]
  end

  defp calculate(operand, stack) when is_number(operand) do
    [operand | stack]
  end

  defp calculate(operand, stack) do
    case Integer.parse(operand) do
      {n, _} -> calculate(n, stack)
      :error -> raise "Invalid token in expression: '#{operand}'"
    end
  end
end
