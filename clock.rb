# clock.rb
# clock method
def clock(hours, min, sec)
  if hours > 23 || hours < 0
    raise ArgumentError, "Hours must be between 0-23"
  end

  if hours < 10
    hours = "0#{hours}"
  end

  if min < 10
    min = "0#{min}"
  end

  if sec < 10
    sec = "0#{sec}"
  end

  return "#{hours}:#{min}:#{sec}"
end
