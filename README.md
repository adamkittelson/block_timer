[![Build Status](https://travis-ci.org/adamkittelson/block_timer.svg?branch=master)](https://travis-ci.org/adamkittelson/block_timer)

BlockTimer
=====

Macros to use :timer.apply_after and :timer.apply_interval with a block, e.g.:

  ```elixir
    iex(1)> import BlockTimer
    nil
    iex(2)> apply_after 3 |> seconds, do: IO.puts "hello"
    {:ok, {1407446427626194, #Reference<0.0.0.371>}}
    iex(3)> hello
  ```

  ```elixir
    iex(1)> import BlockTimer
    nil
    iex(2)> {:ok, counter} = Agent.start_link fn -> 0 end
    {:ok, #PID<0.70.0>}
    iex(3)> {:ok, tref} = apply_interval 1 |> seconds do
    ...(3)> Agent.update(counter, fn(count) -> count + 1 end)
    ...(3)> IO.puts Agent.get(counter, fn(count) -> count end)
    ...(3)> end
    {:ok, {:interval, #Reference<0.0.0.382>}}
    iex(4)> 1
    2
    3
    4
    5
    :timer.cancel tref
    {:ok, :cancel}
    iex(5)>
  ```
