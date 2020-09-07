defmodule Queue do
  @moduledoc """
  a queue is a collection of entities that are maintained in a sequence and can be modified by the addition of entities at one end of the sequence and the removal of entities from the other end of the sequence.

  The operations of a queue make it a first-in-first-out (FIFO) data structure. In a FIFO data structure, the first element added to the queue will be the first one to be removed.
  """

  defstruct [:last_removed, :queue]

  def new(q \\ [], removed \\ nil) do
    %__MODULE__{queue: q, last_removed: removed}
  end

  def add(%Queue{queue: q}, el) do
    new(q ++ [el])
  end

  def remove(%Queue{queue: q}) do
    {el, list} = List.pop_at(q, 0)

    new(list, el)
  end
end
