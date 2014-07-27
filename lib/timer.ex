defmodule Timer do

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

  def now_diff(timestamp2, timestamp1) do
    :timer.now_diff(timestamp2, timestamp1)
  end

  def seconds(seconds) do
    :timer.seconds(seconds)
  end

  def minutes(minutes) do
    :timer.minutes(minutes)
  end

  def hours(hours) do
    :timer.hours(hours)
  end

  def hms(hours, minutes, seconds) do
    :timer.hms(hours, minutes, seconds)
  end

  def _timer_apply(function) do
    function.()
  end
end
