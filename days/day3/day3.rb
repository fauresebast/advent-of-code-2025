module Day3
  def self.parse(input)
    input.lines.map { |line| line.chomp.chars.map(&:to_i) }
  end

  def self.part1(input)
    banks = parse(input)
    line_size = banks.first.size
    banks.sum do |bank|
      first_part = bank[...line_size - 1]
      f = 9.downto(0).find { |f| first_part.include?(f) }
      index = bank.index(f)
      s = bank[index + 1..].max
      "#{f}#{s}".to_i
    end
  end

  def self.part2(input)
    parse(input).sum do |bank|
      joltage(bank)
    end
  end

  def self.joltage(bank)
    current_index = 0
    selected = []
    while selected.size < 12
      usable_range = bank[current_index..bank.size - (12 - selected.size)]
      ur_max = usable_range.max
      ur_max_index = usable_range.index(ur_max)
      selected << ur_max
      current_index += ur_max_index + 1
    end
    selected.join.to_i
  end
end
