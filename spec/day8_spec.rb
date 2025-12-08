require "./days/day8/day8"
RSpec.describe Day8, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day8/sample")
      expect(Day8.part1(str, 10)).to eq 40
    end

    it "works with input" do
      str = File.read("./days/day8/input")
      expect(Day8.part1(str, 1000)).to eq 122430
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day8/sample")
      expect(Day8.part2(str)).to eq 25272
    end

    it "works with input" do
      str = File.read("./days/day8/input")
      expect(Day8.part2(str)).to eq 8135565324
    end
  end
end
