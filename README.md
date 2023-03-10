# ReversePolish

Reverse Polish Notation calculator implemented in Elixir. [Reverse Polish Notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation#Explanation) is a notation made for simplifying expressions by elimination the need for brackets. Expressions contain operands followed by operators and are evaluating in order from left to right. 

The expression `2 + 3` would be written as:

```
3 2 +
```

## Usage

```shell
iex -S mix
```

```elixir
ReversePolish.calculate("3 2 +")
5
```

### Run Tests

```shell
mix test
```

## Goals

- [X] Implement calculator
- [X] Handle unknown characters with a helpful message
- [X] Refactor operators into imported module
- [X] Add some fun operators
- [ ] Add dedicated tests for operators and keep doc tests simple
