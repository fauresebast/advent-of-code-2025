require "./days/day9/day9"
RSpec.describe Day9, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day9/sample")
      expect(Day9.part1(str)).to eq 50
    end

    it "works with input" do
      str = File.read("./days/day9/input")
      expect(Day9.part1(str)).to eq 4748769124
    end
  end

  describe "part 2" do
    xit "works with sample" do
      str = File.read("./days/day9/sample")
      expect(Day9.part2(str)).to eq 24
    end

    xit "works with input" do
      str = File.read("./days/day9/input")
      expect(Day9.part2(str)).to eq nil
    end
  end
end
