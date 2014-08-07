defmodule BlockTimer do

  defmacro apply_after(time_in_ms, env \\ nil, body) do
    quote do
      function = fn -> unquote body[:do] end

      :timer.apply_after(unquote(time_in_ms), BlockTimer, :_block_timer_apply, [function, unquote(env) || __ENV__])
    end
  end

  defmacro apply_interval(time_in_ms, env \\ nil, body) do
    quote do
      function = fn -> unquote body[:do] end

      :timer.apply_interval(unquote(time_in_ms), BlockTimer, :_block_timer_apply, [function, unquote(env) || __ENV__])
    end
  end

  @doc """
  Converts seconds (integer or float) to milliseconds, truncated to an integer

  ## Examples

      iex> BlockTimer.seconds 15
      15000

      iex> BlockTimer.seconds 25.1234
      25123

  """
  def seconds(seconds) do
    seconds
    |> :timer.seconds
    |> trunc
  end

  @doc """
  Converts minutes (integer or float) to milliseconds, truncated to an integer

  ## Examples

      iex> BlockTimer.minutes 15
      900000

      iex> BlockTimer.minutes 0.123456
      7407

  """
  def minutes(minutes) do
    minutes
    |> :timer.minutes
    |> trunc
  end

  @doc """
  Converts hours (integer or float) to milliseconds, truncated to an integer

  ## Examples

      iex> BlockTimer.hours 15
      54000000

      iex> BlockTimer.hours 0.1234567
      444444

  """
  def hours(hours) do
    hours
    |> :timer.hours
    |> trunc
  end

  def _block_timer_apply(function, env) do
    try do
      function.()
    catch
      kind, error ->
        {fun, arity} = env.function
        IO.puts """
        ** BlockTimer apply error, originating from:
             #{env.file}:#{env.line} in #{fun}/#{arity}
           error:
             #{Exception.format(kind, error)}
        """
    end
  end

end
