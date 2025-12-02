module Day2
  def self.parse(input)
    input.split(",").map { |range| range.split("-").map(&:to_i) }.sort
  end

  def self.part1(input)
    ranges = parse(input)
    seq_end = ranges.map(&:last).max.to_s.size
    sequences = (1..("9" * (seq_end / 2)).to_i).map { "#{it}#{it}".to_i }
    summing_invalid_ids(ranges, sequences)
  end

  def self.part2(input)
    ranges = parse(input)
    seq_end = ranges.map(&:last).max.to_s.size
    sequences = (1..("9" * (seq_end / 2)).to_i).flat_map do |x|
      (2..(seq_end / x.to_s.size)).map do |repetition|
        (x.to_s * repetition).to_i
      end
    end.uniq.sort
    summing_invalid_ids(ranges, sequences)
  end

  def self.summing_invalid_ids(ranges, sequences)
    sum_of_invalid_ids = 0
    current_range = ranges.shift
    sequences.each do |seq|
      if seq < current_range.first
        next
      elsif seq > current_range.last
        current_range = ranges.shift while current_range && seq > current_range.last
        break if current_range.nil?
      end
      sum_of_invalid_ids += seq if seq.between?(current_range.first, current_range.last)
    end
    sum_of_invalid_ids
  end
end
