defmodule CSPracticeTest do
  use ExUnit.Case
  doctest CSPractice
  doctest Heap

  test "greets the world" do
    assert CSPractice.hello() == :world
  end
end
