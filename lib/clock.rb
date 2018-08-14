def clock(hours, min, sec)
  inputs = [hours, min, sec]
  max_inputs = [23, 59, 59]

  3.times do |index|
    if inputs[index] > max_inputs[index]
      raise ArgumentError, "#{inputs[index]} is too large"
    elsif inputs[index] < 0
      raise ArgumentError, "#{inputs[index]} is too small"
    elsif inputs[index] < 10
      inputs[index] = "0#{inputs[index]}"
    end
  end
  return "#{inputs[0]}:#{inputs[1]}:#{inputs[2]}"
end
