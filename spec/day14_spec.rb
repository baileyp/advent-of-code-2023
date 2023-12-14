require_relative '../lib/day14'

describe Day14 do
  input = <<~INPUT
    O....#....
    O.OO#....#
    .....##...
    OO.#O....O
    .O.....O#.
    O.#..O.#.#
    ..O..#O..O
    .......O..
    #....###..
    #OO..#....
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day14.part1(input)).to eq(136)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day14.part2(input)).to eq(nil)
    end
  end

  describe ".tilt_line" do
    it "tilts a line" do
      expect(Day14.tilt_line("##..O.O.OO")).to eq("##....OOOO")
      expect(Day14.tilt_line("##.#..O#.#")).to eq("##.#..O#.#")
      expect(Day14.tilt_line("..O..#.O.O")).to eq("....O#..OO")
    end
  end
end
