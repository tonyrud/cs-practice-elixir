defmodule Stack do
  @moduledoc """
  A stack is an abstract data type that serves as a collection of elements, with two main principal operations:

  - push: adds an element to the collection, and
  - pop: removes the most recently added element that was not yet removed.

  The order in which elements come off a stack gives rise to its alternative name, LIFO (last in, first out). Additionally, a peek operation may give access to the top without modifying the stack.
  """

  @capacity 3
  def new() do
    {:ok, []}
  end

  def push({_, stack}, _item) when length(stack) == @capacity do
    {:error, "capacity reached"}
  end

  def push({_, stack}, item) do
    {:ok, stack ++ [item]}
  end

  @doc """
  Removes most recent value and updated stack
  """
  def pop({_, stack}) do
    List.pop_at(stack, -1)
  end

  def peek({_, stack}, location) do
    case Enum.fetch(stack, location) do
      {:ok, el} -> el
      :error -> {:error, "No element found in #{inspect(stack)} at location: #{location}"}
    end
  end
end
