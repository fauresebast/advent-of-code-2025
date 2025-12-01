require "./days/day1/day1"
RSpec.describe Day1, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day1/sample")
      expect(Day1.part1(str)).to eq 3
    end

    it "works with input" do
      str = File.read("./days/day1/input")
      expect(Day1.part1(str)).to eq 1154
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day1/sample")
      expect(Day1.part2(str)).to eq 6
    end

    it "works with sample2" do
      str = File.read("./days/day1/sample2")
      expect(Day1.part2(str)).to eq 8
    end

    it "works with input" do
      str = File.read("./days/day1/input")
      expect(Day1.part2(str)).to eq 6819
    end
  end
end
