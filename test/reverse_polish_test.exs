defmodule ReversePolishTest do
  use ExUnit.Case
  doctest ReversePolish

  test "greets the world" do
    assert ReversePolish.hello() == :world
  end
end
