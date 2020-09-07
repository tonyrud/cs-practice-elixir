defmodule QueueTest do
  use ExUnit.Case

  doctest Queue

  test "creates a new queue" do
    assert Queue.new() == %Queue{queue: []}
  end

  test "adds elements to end of queue" do
    q =
      Queue.new()
      |> Queue.add(:yep)
      |> Queue.add(:yeppp)

    assert q == %Queue{queue: [:yep, :yeppp]}
  end

  test "removes first element of queue" do
    %Queue{last_removed: item, queue: q} =
      Queue.new()
      |> Queue.add(11)
      |> Queue.add(22)
      |> Queue.add(33)
      |> Queue.remove()

    assert item == 11
    assert q == [22, 33]
  end

  test "removes first of queue" do
    %Queue{queue: q} =
      Queue.new()
      |> Queue.add(11)
      |> Queue.remove()
      |> Queue.add(22)
      |> Queue.remove()
      |> Queue.add(33)

    assert q == [33]
  end
end
