require "./days/day3/day3"
RSpec.describe Day3, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day3/sample")
      expect(Day3.part1(str)).to eq 357
    end

    it "works with input" do
      str = File.read("./days/day3/input")
      expect(Day3.part1(str)).to eq 17613
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day3/sample")
      expect(Day3.part2(str)).to eq 3121910778619
    end

    it "works with input" do
      str = File.read("./days/day3/input")
      expect(Day3.part2(str)).to eq 175304218462560
    end
  end
end
