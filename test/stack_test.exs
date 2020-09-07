defmodule StackTest do
  use ExUnit.Case

  doctest Stack

  test "creates a new stack" do
    assert Stack.new() == {:ok, []}
  end

  test "adds and removes with first in, last out" do
    stack =
      Stack.new()
      |> Stack.push(1)
      |> Stack.push(3)
      |> Stack.push(5)

    stack_1 = Stack.pop(stack)
    stack_2 = Stack.pop(stack_1)

    assert stack_1 == {5, [1, 3]}
    assert stack_2 == {3, [1]}
  end

  test "gets value at position" do
    stack =
      Stack.new()
      |> Stack.push(1)
      |> Stack.push(3)

    assert Stack.peek(stack, 0) == 1
    assert Stack.peek(stack, 1) == 3
  end

  test "returns error on missing position" do
    stack =
      Stack.new()
      |> Stack.push(1)
      |> Stack.push(3)

    assert Stack.peek(stack, 55) == {:error, "No element found in [1, 3] at location: 55"}
  end

  test "errors if capacity met" do
    assert Enum.reduce(1..4, Stack.new(), fn x, acc ->
             Stack.push(acc, x)
           end) == {:error, "capacity reached"}
  end
end
