defmodule StatefulCycle do
  use GenServer

  def start_link(list) do
    GenServer.start_link(__MODULE__, list)
  end

  def init(args) do
    {:ok, {(for <<x::8 <- args>>, do: <<x>>), []}}
  end

  def next(pid) do
    GenServer.call(pid, :next)
  end

  def handle_call(:next, _from, {[], complete}) do
    [head | reversed] = Enum.reverse(complete)
    {:reply, head, {reversed, [head]}}
  end

  def handle_call(:next, _from, {[head | rest], completed}) do
    {:reply, head, {rest, [head | completed]}}
  end


end
