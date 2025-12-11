require "./days/day10/day10"
RSpec.describe Day10, "#solve" do
  describe "part 1" do
    xit "works with sample" do
      str = File.read("./days/day10/sample")
      expect(Day10.part1(str)).to eq 7
    end

    xit "works with input" do
      str = File.read("./days/day10/input")
      expect(Day10.part1(str)).to eq nil
    end
  end

  describe "part 2" do
    xit "works with sample" do
      str = File.read("./days/day10/sample")
      expect(Day10.part2(str)).to eq nil
    end

    xit "works with input" do
      str = File.read("./days/day10/input")
      expect(Day10.part2(str)).to eq nil
    end
  end
end
