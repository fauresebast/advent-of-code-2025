module Day4
  def self.parse(input)
    input.split("\n").map(&:chars)
  end

  def self.part1(input)
    grid = parse(input)
    accessible_roll_of_paper(grid).size
  end

  def self.part2(input)
    grid = parse(input)
    total = 0
    loop do
      to_remove = accessible_roll_of_paper(grid)
      break if to_remove.empty?

      total += to_remove.size
      to_remove.each do |row, col|
        grid[row][col] = "."
      end
    end
    total
  end

  def self.accessible_roll_of_paper(grid)
    res = []
    height = grid.size
    width = grid[0].size
    (0...height).each do |row|
      (0...width).each do |col|
        next unless grid[row][col] == "@"
        neighbours = 0
        (-1..1).each do |dr|
          (-1..1).each do |dc|
            nr, nc = row + dr, col + dc
            next if nr < 0 || nr >= height || nc < 0 || nc >= width

            neighbours += 1 if grid[nr][nc] == "@"
          end
        end
        res << [row, col] if neighbours <= 4
      end
    end
    res
  end
end
