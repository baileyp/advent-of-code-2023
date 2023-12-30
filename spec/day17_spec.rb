require_relative '../lib/day17'

describe Day17 do
  input = <<~INPUT
    2413432311323
    3215453535623
    3255245654254
    3446585845452
    4546657867536
    1438598798454
    4457876987766
    3637877979653
    4654967986887
    4564679986453
    1224686865563
    2546548887735
    4322674655533
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day17.part1(input)).to eq(102)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day17.part2(input)).to eq(nil)
    end
  end
end
