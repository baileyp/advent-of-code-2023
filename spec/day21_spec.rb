require_relative '../lib/day21'

describe Day21 do
  input = <<~INPUT
    ...........
    .....###.#.
    .###.##..#.
    ..#.#...#..
    ....#.#....
    .##..S####.
    .##..#...#.
    .......##..
    .##.#.####.
    .##..##.##.
    ...........
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day21.part1(input, 6)).to eq(16)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day21.part2(input)).to eq(nil)
    end
  end
end
