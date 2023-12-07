require_relative '../lib/day03'

describe Day03 do
  describe ".part1" do
    it "returns the sum of the numbers in the input" do
      input = <<~INPUT
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      INPUT

      expect(Day03.part1(input)).to eq(4361)
    end

    it "returns the sum of the numbers in the input even with a part number at the end" do
      input = <<~INPUT
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*...+
        .664.598.1
      INPUT

      expect(Day03.part1(input)).to eq(4362)
    end
  end

  describe ".part2" do
    it "returns the sum of the gear ratios in the input" do
      input = <<~INPUT
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      INPUT

      expect(Day03.part2(input)).to eq(467835)
    end

    it "returns the sum of the gear ratios in the input part 2" do
      input = <<~INPUT
        467..11...
        ...*....*.
        ..35...3.4
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      INPUT

      expect(Day03.part2(input)).to eq(467847)
    end
  end


  describe ".neighbors" do
    it "returns the neighbors of a given cell" do
      expect(Day03.neighbors(0, 0)).to eq([[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]])
      expect(Day03.neighbors(0, 1)).to eq([[-1, 0], [-1, 1], [-1, 2], [0, 0], [0, 2], [1, 0], [1, 1], [1, 2]])
      expect(Day03.neighbors(3, 3)).to eq([[2, 2], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3], [4, 4]])
    end
  end
end