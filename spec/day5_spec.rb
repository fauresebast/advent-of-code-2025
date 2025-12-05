require "./days/day5/day5"
RSpec.describe Day5, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day5/sample")
      expect(Day5.part1(str)).to eq 3
    end

    it "works with input" do
      str = File.read("./days/day5/input")
      expect(Day5.part1(str)).to eq 744
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day5/sample")
      expect(Day5.part2(str)).to eq 14
    end

    it "works with input" do
      str = File.read("./days/day5/input")
      expect(Day5.part2(str)).to eq 347468726696961
    end
  end
end
