module Day9
  def self.parse(input)
    input.lines.map { |line| line.split(",").map(&:to_i) }
  end

  def self.part1(input)
    tiles = parse(input)
    biggest_area = 0
    tiles.each_with_index do |tile, index|
      tiles[index + 1..].each do |other_tile|
        area = ((tile.first - other_tile.first).abs + 1) * ((tile.last - other_tile.last).abs + 1)
        biggest_area = area if area > biggest_area
      end
    end
    biggest_area
  end

  class Rectangle
    attr_reader :left, :right, :top, :bottom
    def initialize(corner_a, corner_b)
      @left, @right = [corner_a.first, corner_b.first].minmax
      @top, @bottom = [corner_a.last, corner_b.last].minmax
    end

    def overlap?(r)
      !(
        @left + 1 > r.right ||
        @right < r.left + 1 ||
        @bottom < r.top + 1 ||
        @top + 1 > r.bottom
      )
    end

    def area
      (right - left + 1) * (bottom - top + 1)
    end
  end

  def self.part2(input)
    tiles = parse(input)
    overlapping_rectangles = {}
    tiles.each_with_index do |tile, index|
      tiles[index + 1..].each do |other_tile|
        rectangle = Rectangle.new(tile, other_tile)
        overlapping_rectangles[rectangle] = false
      end
    end
    rectangles = overlapping_rectangles.keys
    rectangles.each do |a|
      (rectangles - [a]).each do |b|
        overlapping_rectangles[a] ||= []
        overlapping_rectangles[a] << b if a.overlap?(b)
        overlapping_rectangles[b] ||= []
        overlapping_rectangles[b] << a if a.overlap?(b)
      end
    end
    r = []
    a = Rectangle.new([2, 3], [4, 5])
    b = Rectangle.new([4, 5], [7, 8])
    r << [a.overlap?(b), b.overlap?(a)]

    b = Rectangle.new([4, 1], [4, 3])
    r << [a.overlap?(b), b.overlap?(a)]

    b = Rectangle.new([0, 0], [2, 3])
    r << [a.overlap?(b), b.overlap?(a)]

    b = Rectangle.new([0, 5], [2, 7])
    r << [a.overlap?(b), b.overlap?(a)]
    p overlapping_rectangles.reject { _2.size > 0 }.map { |r, _| r.area }
  end
end
