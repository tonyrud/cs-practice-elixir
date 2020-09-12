defmodule LinkedList do
  defmodule Node do
    @enforce_keys [:data]
    defstruct [:data, next: nil]
  end

  defstruct head: nil

  def new(%Node{} = node) do
    %__MODULE__{head: node}
  end

  def insert(%LinkedList{head: head}, %Node{} = node) do
    nodes = insert(head, node)
    new(nodes)
  end

  def insert(%Node{next: nil} = tail, %Node{} = new_node) do
    %Node{tail | next: new_node}
  end

  def insert(%Node{} = head, %Node{} = new_node) do
    %Node{head | next: insert(head.next, new_node)}
  end

  def tail(%Node{next: nil} = node) do
    node
  end

  def tail(%Node{next: next}) do
    tail(next)
  end

  def tail(%LinkedList{head: head}) do
    tail(head)
  end
end
