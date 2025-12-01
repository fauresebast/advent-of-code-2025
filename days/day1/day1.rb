module Day1
  def self.parse(input)
    input.lines.map do |line|
      { direction: line[0], steps: line[1..].to_i }
    end
  end

  def self.part1(input)
    position = 50
    password = 0
    parse(input).each do |instruction|
      case instruction[:direction]
      when "L"
        position -= instruction[:steps]
      when "R"
        position += instruction[:steps]
      end
      position = position % 100
      password += 1 if position.zero?
    end
    password
  end

  # TOO LOW: 2516
  def self.part2(input)
    position = 50
    password = 0
    parse(input).each do |instruction|
      prev_position = position
      case instruction[:direction]
      when "L"
        position -= instruction[:steps]
      when "R"
        position += instruction[:steps]
      end
      r = Range.new(*[prev_position, position].sort)
      password += r.count { |x| x % 100 == 0 }
      password -= 1 if prev_position.zero?
      position = position % 100
    end
    password
  end
end
