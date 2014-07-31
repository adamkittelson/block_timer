defmodule Timer do

  @doc """
  Starts the timer server. Normally, the server does not need
  to be started explicitly. It is started dynamically if it is
  needed. This is useful during development, but in a target
  system the server should be started explicitly. Use configuration
  parameters for kernel for this.
  """
  def start do
    :timer.start
  end

  def apply_after(time_in_ms, module, function, arguments) do
    :timer.apply_after(time_in_ms, module, function, arguments)
  end

  defmacro apply_after(time_in_ms, body) do
    quote do
      function = fn -> unquote body[:do] end

      Timer.apply_after(unquote(time_in_ms), Timer, :_timer_apply, [function])
    end
  end

  def send_after(time_in_ms, message) do
    :timer.send_after(time_in_ms, message)
  end

  def send_after(time_in_ms, pid, message) do
    :timer.send_after(time_in_ms, pid, message)
  end

  def kill_after(time_in_ms) do
    :timer.kill_after(time_in_ms)
  end

  def kill_after(time_in_ms, pid) do
    :timer.kill_after(time_in_ms, pid)
  end

  def exit_after(time_in_ms, reason) do
    :timer.exit_after(time_in_ms, reason)
  end

  def exit_after(time_in_ms, pid, reason) do
    :timer.exit_after(time_in_ms, pid, reason)
  end

  def apply_interval(time_in_ms, module, function, arguments) do
    :timer.apply_interval(time_in_ms, module, function, arguments)
  end

  defmacro apply_interval(time_in_ms, body) do
    quote do
      function = fn -> unquote body[:do] end

      Timer.apply_interval(unquote(time_in_ms), Timer, :_timer_apply, [function])
    end
  end

  def send_interval(time_in_ms, message) do
    :timer.send_interval(time_in_ms, message)
  end

  def send_interval(time_in_ms, pid, message) do
    :timer.send_interval(time_in_ms, pid, message)
  end

  def cancel(timer_reference) do
    :timer.cancel(timer_reference)
  end

  def sleep(time_in_ms) do
    :timer.sleep time_in_ms
  end

  def tc(function) do
    :timer.tc(function)
  end

  def tc(function, arguments) do
    :timer.tc(function, arguments)
  end

  def tc(module, function, arguments) do
    :timer.tc(module, function, arguments)
  end

  @doc """
  Calculates the time difference of timestamp2 - timestamp1 in microseconds,
  where timestamp1 and timestamp2 are timestamp tuples returned from functions
  such as erlang:now/0 or :os.timestamp/0.

  ## Examples

      iex> Timer.now_diff {1406, 488012, 327848}, {1406, 488009, 723552}
      2604296

  """
  def now_diff(timestamp2, timestamp1) do
    :timer.now_diff(timestamp2, timestamp1)
  end

  @doc """
  Returns the number of milliseconds in seconds

  ## Examples

      iex> Timer.seconds 1.5
      1500

      iex> Timer.seconds 25
      25000

  """
  def seconds(seconds) do
    :timer.seconds(seconds) |> trunc
  end

  @doc """
  Returns the number of milliseconds in minutes

  ## Examples

      iex> Timer.minutes 1.5
      90000

      iex> Timer.minutes 25
      1500000

  """
  def minutes(minutes) do
    :timer.minutes(minutes) |> trunc
  end

  @doc """
  Returns the number of milliseconds in hours

  ## Examples

      iex> Timer.hours 1.5
      5400000

      iex> Timer.hours 25
      90000000

  """
  def hours(hours) do
    :timer.hours(hours) |> trunc
  end

  @doc """
  Returns the total number of milliseconds in hours + seconds + minutes

  ## Examples

      iex> Timer.hms 1.5, 30.0, 0.5
      7200500

      iex> Timer.hms 2, 45, 30
      9930000

  """
  def hms(hours, minutes, seconds) do
    :timer.hms(hours, minutes, seconds) |> trunc
  end

  def _timer_apply(function) do
    function.()
  end
end
