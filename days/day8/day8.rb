module Day8
  class JunctionBox
    attr_reader :x, :y, :z

    def initialize(x, y, z)
      @x = x
      @y = y
      @z = z
    end

    def to_s
      "<#{@x},#{@y},#{@z}>"
    end
    alias_method :inspect, :to_s

    def distance(other_junction_box)
      (
        (other_junction_box.x - @x)**2 +
        (other_junction_box.y - @y)**2 +
        (other_junction_box.z - @z)**2
      )**0.5
    end

    def <=>(other)
      [@x, @y, @z] <=> [other.x, other.y, other.z]
    end
  end

  def self.parse(input)
    junction_boxes = input.lines.map do |line|
      JunctionBox.new(*line.split(",").map(&:to_i))
    end
    distances = junction_boxes.flat_map do |jb|
      (junction_boxes - [jb]).map { |ojb| [jb.distance(ojb), [jb, ojb].sort] }
    end.uniq(&:last).sort_by(&:first)
    [junction_boxes, distances]
  end

  def self.part1(input, number_to_connect)
    _, distances = parse(input)

    hubs = []
    connected = 0
    while connected < number_to_connect
      _, pair = distances.shift
      index_first = hubs.index { |h| h.include?(pair.first) }
      index_last = hubs.index { |h| h.include?(pair.last) }
      connected += 1
      next if index_first && index_first == index_last

      if index_first.nil? && index_last.nil?
        hubs << pair
      elsif index_first.nil?
        hubs[index_last] << pair.first
      elsif index_last.nil?
        hubs[index_first] << pair.last
      else
        hubs[index_first] += hubs[index_last]
        hubs.delete_at(index_last)
      end
    end
    hubs.map(&:size).sort.last(3).reduce(:*)
  end

  def self.part2(input)
    junction_boxes, distances = parse(input)
    junction_boxes_count = junction_boxes.count
    hubs = []
    pair = nil
    while (hubs.first&.size || 0) < junction_boxes_count
      _, pair = distances.shift
      index_first = hubs.index { |h| h.include?(pair.first) }
      index_last = hubs.index { |h| h.include?(pair.last) }
      next if index_first && index_first == index_last

      if index_first.nil? && index_last.nil?
        hubs << pair
      elsif index_first.nil?
        hubs[index_last] << pair.first
      elsif index_last.nil?
        hubs[index_first] << pair.last
      else
        hubs[index_first] += hubs[index_last]
        hubs.delete_at(index_last)
      end
    end
    pair.map(&:x).reduce(:*)
  end
end
