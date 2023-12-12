require_relative '../lib/day12'

describe Day12 do
  input = <<~INPUT
    ???.### 1,1,3
    .??..??...?##. 1,1,3
    ?#?#?#?#?#?#?#? 1,3,1,6
    ????.#...#... 4,1,1
    ????.######..#####. 1,6,5
    ?###???????? 3,2,1
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day12.part1(input)).to eq(21)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day12.part2(input)).to eq(525152)
    end
  end

  describe ".make_permutations" do
    it "returns an array of permutations" do
      expect(Day12.make_permutations("??")).to eq(["..", ".#", "#.", "##"])
      expect(Day12.make_permutations("?.?")).to eq(["...", "..#", "#..", "#.#"])
      expect(Day12.make_permutations("??#")).to eq(["..#", ".##", "#.#", "###"])
    end
  end

  describe ".test_condition" do
    it "returns the number of pots with plants" do
      expect(Day12.test_condition("#.#.###", [1, 1, 3])).to eq(true)
      expect(Day12.test_condition("#..####", [1, 1, 3])).to eq(false)
      expect(Day12.test_condition("..#..#....###.", [1, 1, 3])).to eq(true)
    end
  end

  describe ".test_condition_partial" do
    it "returns the number of pots with plants" do
      expect(Day12.test_condition_partial("#.#.#", [1, 1, 3])).to eq(true)
      expect(Day12.test_condition_partial("#..###", [4, 1, 1])).to eq(false)
      expect(Day12.test_condition_partial("#.#...", [4, 1, 1])).to eq(false)
    end
  end

  describe ".fold" do
    it "repeats the inputs 5x" do
      expect(Day12.fold(".#", [1])).to eq([".#?.#?.#?.#?.#", [1, 1, 1, 1, 1]])
      expect(Day12.fold("A", [3, 4])).to eq(["A?A?A?A?A", [3, 4, 3, 4, 3, 4, 3, 4, 3, 4]])
    end
  end
end
