require_relative '../lib/day06'

describe Day06 do
  input = <<~INPUT
    Time:      7  15   30
    Distance:  9  40  200
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day06.part1(input)).to eq(288)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day06.part2(input)).to eq(71503)
    end
  end

  describe ".parse_input" do
    it "returns the input parsed into races" do
      races = [[7, 9], [15, 40], [30, 200]]
      expect(Day06.parse_input(input)).to eq(races)
    end
  end

  describe ".parse_input2" do
    it "returns the input parsed into a single race" do
      expect(Day06.parse_input2(input)).to eq([71530, 940200])
    end
  end
end