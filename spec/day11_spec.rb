require "./days/day11/day11"
RSpec.describe Day11, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day11/sample")
      expect(Day11.part1(str)).to eq 5
    end

    it "works with input" do
      str = File.read("./days/day11/input")
      expect(Day11.part1(str)).to eq 690
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day11/sample2")
      expect(Day11.part2(str)).to eq 2
    end

    xit "works with input" do
      str = File.read("./days/day11/input")
      expect(Day11.part2(str)).to eq nil
    end
  end
end
