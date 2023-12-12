require_relative '../lib/day09'

describe Day09 do
  input = <<~INPUT
    0 3 6 9 12 15
    1 3 6 10 15 21
    10 13 16 21 30 45
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day09.part1(input)).to eq(114)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day09.part2(input)).to eq(nil)
    end
  end

  describe ".build_next_sequence" do
    it "returns the next sequence" do
      expect(Day09.build_next_sequence([0, 3, 6, 9, 12, 15])).to eq([3, 3, 3, 3, 3])
      expect(Day09.build_next_sequence([1, 3, 6, 10, 15, 21])).to eq([2, 3, 4, 5, 6])
      expect(Day09.build_next_sequence([10, 13, 16, 21, 30, 45])).to eq([3, 3, 5, 9, 15])
    end
  end

  describe ".generate_all_differences" do
    it "returns all differences" do
      expect(Day09.generate_all_differences([0, 3, 6, 9, 12, 15])).to eq([
        [0, 3, 6, 9, 12, 15],
        [3, 3, 3, 3, 3],
        [0, 0, 0, 0]
      ])
    end
  end
end
