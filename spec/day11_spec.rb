require_relative '../lib/day11'

describe Day11 do
  input = <<~INPUT
    ...#......
    .......#..
    #.........
    ..........
    ......#...
    .#........
    .........#
    ..........
    .......#..
    #...#.....
  INPUT

  galaxies = [
    [0, 3],
    [1, 7],
    [2, 0],
    [4, 6],
    [5, 1],
    [6, 9],
    [8, 7],
    [9, 0],
    [9, 4],
  ]

  galaxies_expanded = [
    [0, 4],
    [1, 9],
    [2, 0],
    [5, 8],
    [6, 1],
    [7, 12],
    [10, 9],
    [11, 0],
    [11, 5],
  ]

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day11.part1(input)).to eq(374)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2 at 10x expansion" do
      expect(Day11.part2(input, 10)).to eq(1030)
    end

    it "returns the solution to part 2 at 100x expansion" do
      expect(Day11.part2(input, 100)).to eq(8410)
    end
  end

  describe ".find_galaxies" do
    it "returns the galaxy locations" do
      expect(Day11.find_galaxies(input)).to eq(galaxies)
    end
  end

  describe ".expand_space" do
    it "expands the empty space between galaxies" do
      expect(Day11.expand_space(galaxies, 2)).to eq(galaxies_expanded)
    end
  end
end
