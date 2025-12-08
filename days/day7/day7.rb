module Day7
  def self.parse(input)
    input.split("\n")
  end

  def self.part1(input)
    rows = parse(input)
    beams = [rows.first.index("S")]
    splitter_encountered_count = 0
    rows.each do |row|
      next unless row["^"]

      beams = beams.flat_map do |beam|
        if row[beam] == "^"
          splitter_encountered_count += 1
          r = []
          r << beam - 1 if beam - 1 >= 0
          r << beam + 1 if row[beam + 1]
        else
          beam
        end
      end.uniq
    end
    splitter_encountered_count
  end

  @@mem = {}
  def self.part2(input)
    rows = parse(input)
    start = rows.first.index("S")
    compute_beam([start], 0, rows)
    @@mem[[start, 0]]
  end

  def self.compute_beam(beam, depth, rows)
    return @@mem[[beam.last, depth]] if @@mem[[beam.last, depth]]

    row = rows[depth]
    if row.nil?
      @@mem[[beam.last, depth]] = 1
      1
    elsif row[beam.last] == "^"
      r = []
      if beam.last - 1 >= 0
        r << compute_beam(beam + [beam.last - 1], depth + 1, rows)
      end
      if row[beam.last + 1]
        r << compute_beam(beam + [beam.last + 1], depth + 1, rows)
      end
      @@mem[[beam.last, depth]] = r.sum
      r.sum
    else
      r = compute_beam(beam, depth + 1, rows)
      @@mem[[beam.last, depth]] = r
      r
    end
  end
end
