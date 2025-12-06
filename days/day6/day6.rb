module Day6
  def self.parse(input)
    input.split("\n")
  end

  def self.part1(input)
    parse(input).map(&:split).transpose.sum do |*numbers, op|
      numbers.map(&:to_i).reduce(op.to_sym)
    end
  end

  def self.part2(input)
    total = 0
    acc = []
    parse(input).map(&:chars).transpose.reverse_each do |*digits, op|
      next if digits.all? { |d| d.strip.empty? }
      acc << digits.join.to_i
      if op != " "
        total += acc.reduce(op.to_sym)
        acc = []
      end
    end
    total
  end
end
