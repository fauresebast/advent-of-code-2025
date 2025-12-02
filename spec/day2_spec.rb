require "./days/day2/day2"
RSpec.describe Day2, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day2/sample")
      expect(Day2.part1(str)).to eq 1227775554
    end

    it "works with input" do
      str = File.read("./days/day2/input")
      expect(Day2.part1(str)).to eq 12850231731
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day2/sample")
      expect(Day2.part2(str)).to eq 4174379265
    end

    it "works with input" do
      str = File.read("./days/day2/input")
      expect(Day2.part2(str)).to eq 24774350322
    end
  end
end
