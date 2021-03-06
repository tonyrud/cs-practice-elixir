defmodule Heap do
  @moduledoc """
  Practice implementing Heaps
  A heap is a binary tree where:
  - The root node is the minimum value (min heap)
  or
  - The root node is the maximum value (max heap)
  Inserts are top-to-bottom and left-to-right
  A small value added to the bottom of a heap bubbles up to the appropriate position
  """

  defstruct [:capacity, :size, list: []]

  @doc """
  Creates heap struct with defaults


  ## Examples
      iex> Heap.new()
      %Heap{capacity: 10, size: 0, list: []}

      iex> Heap.new(2, 3)
      %Heap{capacity: 2, size: 3, list: []}
  """
  def new(capacity \\ 10, size \\ 0) do
    %__MODULE__{capacity: capacity, size: size}
  end
end
