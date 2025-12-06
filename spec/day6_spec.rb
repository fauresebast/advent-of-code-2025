require "./days/day6/day6"
RSpec.describe Day6, "#solve" do
  describe "part 1" do
    it "works with sample" do
      str = File.read("./days/day6/sample")
      expect(Day6.part1(str)).to eq 4277556
    end

    it "works with input" do
      str = File.read("./days/day6/input")
      expect(Day6.part1(str)).to eq 4449991244405
    end
  end

  describe "part 2" do
    it "works with sample" do
      str = File.read("./days/day6/sample")
      expect(Day6.part2(str)).to eq 3263827
    end

    it "works with input" do
      str = File.read("./days/day6/input")
      expect(Day6.part2(str)).to eq 9348430857627
    end
  end
end
