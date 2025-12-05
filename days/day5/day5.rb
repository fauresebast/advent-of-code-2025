module Day5
  def self.parse(input)
    ranges, ids = input.split("\n\n")
    [
      ranges.lines.map { it.split("-").map(&:to_i) }.sort,
      ids.lines.map(&:to_i)
    ]
  end

  def self.part1(input)
    ranges, ids = parse(input)

    ids.count do |id|
      found = false
      ranges.each do |range|
        if Range.new(*range).include?(id)
          found = true
          break
        elsif range[0] > id
          break
        end
      end
      found
    end
  end

  def self.part2(input)
    ranges, _ = parse(input)
    merged = []
    while ranges.size > 1
      c = ranges.shift
      n = ranges.shift
      if c.last >= n.first
        n[0] = c.first
        n[1] = [c.last, n.last].max
      else
        merged << c
      end
      ranges = [n] + ranges
    end
    merged << ranges.shift
    merged.sum { |r| r.last - r.first + 1 }
  end
end
