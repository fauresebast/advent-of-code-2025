require "./days/day4/day4"
RSpec.describe Day4, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day4/sample")
      expect(Day4.part1(str)).to eq 13
    end

    it "works with input" do
      str = File.read("./days/day4/input")
      expect(Day4.part1(str)).to eq 1480
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day4/sample")
      expect(Day4.part2(str)).to eq 43
    end

    it "works with input" do
      str = File.read("./days/day4/input")
      expect(Day4.part2(str)).to eq 8899
    end
  end
end
