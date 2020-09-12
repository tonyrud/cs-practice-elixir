defmodule LinkedListTest do
  use ExUnit.Case

  alias LinkedList.Node

  @base_node %Node{data: "base node"}
  @second_node %Node{data: "2nd"}
  @third_node %Node{data: "3rd"}

  describe "Node" do
    test "creates new node" do
      assert %Node{data: 3} == %Node{data: 3, next: nil}
    end

    test "creates new node with next" do
      next_node = %Node{data: "next"}
      assert %Node{data: 3, next: next_node} == %Node{data: 3, next: next_node}
    end
  end

  describe "LinkedList" do
    test "new" do
      assert LinkedList.new(@base_node) == %LinkedList{head: @base_node}
    end

    test "insert adds new node into next" do
      ll =
        @base_node
        |> LinkedList.new()
        |> LinkedList.insert(@second_node)
        |> LinkedList.insert(@third_node)

      assert ll == %LinkedList{
               head: %Node{
                 data: "base node",
                 next: %Node{
                   data: "2nd",
                   next: %Node{
                     data: "3rd",
                     next: nil
                   }
                 }
               }
             }
    end

    test "tail returns last node" do
      ll =
        @base_node
        |> LinkedList.new()
        |> LinkedList.insert(@second_node)
        |> LinkedList.insert(@third_node)

      assert LinkedList.tail(ll) == %Node{data: "3rd", next: nil}
    end
  end
end
