require "./days/day7/day7"
RSpec.describe Day7, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day7/sample")
      expect(Day7.part1(str)).to eq 21
    end

    it "works with input" do
      str = File.read("./days/day7/input")
      expect(Day7.part1(str)).to eq 1717
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day7/sample")
      expect(Day7.part2(str)).to eq 40
    end

    it "works with input" do
      str = File.read("./days/day7/input")
      expect(Day7.part2(str)).to eq 231507396180012
    end
  end
end
