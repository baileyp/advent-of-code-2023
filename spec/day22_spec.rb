require_relative '../lib/day22'

describe Day22 do
  input = <<~INPUT
    1,0,1~1,2,1
    0,0,2~2,0,2
    0,2,3~2,2,3
    0,0,4~0,2,4
    2,0,5~2,2,5
    0,1,6~2,1,6
    1,1,8~1,1,9
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day22.part1(input)).to eq(5)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day22.part2(input)).to eq(nil)
    end
  end

  describe ".parse_line" do
    it "returns the parsed line" do
      expect(Day22.parse_line("1,0,1~1,2,1")).to eq([[1, 1], [0, 2], [1, 1]])
    end
  end

  describe ".supported?" do
    it "returns false if used in the wrong order" do
      brick1 = [[1, 3], [2, 2], [3, 3]] # tester
      brick2 = [[1, 3], [2, 2], [2, 2]] # identical
      expect(Day22.supported?(brick2, brick1)).to eq(false)
    end

    it "returns true for completely overlapped bricks" do
      brick1 = [[1, 3], [2, 2], [3, 3]] # tester
      brick2 = [[1, 3], [2, 2], [2, 2]] # identical
      brick3 = [[2, 2], [2, 2], [2, 2]] # dot in center
      brick4 = [[0, 4], [2, 2], [2, 2]] # full underlap
      brick5 = [[3, 3], [2, 2], [2, 2]] # dot on edge
      brick6 = [[3, 3], [2, 2], [0, 2]] # pillar on edge
      expect(Day22.supported?(brick1, brick2)).to eq(true)
      expect(Day22.supported?(brick1, brick3)).to eq(true)
      expect(Day22.supported?(brick1, brick4)).to eq(true)
      expect(Day22.supported?(brick1, brick5)).to eq(true)
      expect(Day22.supported?(brick1, brick6)).to eq(true)
    end

    it "returns works for tall skinny bricks" do
      brick1 = [[1, 1], [2, 2], [3, 5]] # tester
      brick2 = [[1, 1], [2, 2], [1, 2]] # pillar below
      brick3 = [[1, 1], [2, 2], [2, 2]] # dot below
      brick4 = [[0, 2], [2, 2], [2, 2]] # y line
      brick5 = [[1, 1], [1, 3], [2, 2]] # x line
      expect(Day22.supported?(brick1, brick2)).to eq(true)
      expect(Day22.supported?(brick1, brick2)).to eq(true)
      expect(Day22.supported?(brick1, brick3)).to eq(true)
      expect(Day22.supported?(brick1, brick4)).to eq(true)
      expect(Day22.supported?(brick1, brick5)).to eq(true)
    end

    it "returns true for crossed bricks" do
      brick1 = [[0, 2], [2, 2], [3, 3]] # tester
      brick2 = [[1, 1], [0, 2], [2, 2]] # crossed at middle
      expect(Day22.supported?(brick1, brick2)).to eq(true)
    end

    it "returns true for just touching bricks at an L" do
      brick1 = [[0, 2], [2, 2], [3, 3]] # tester
      brick2 = [[2, 2], [0, 2], [2, 2]] # crossed at ends
      expect(Day22.supported?(brick1, brick2)).to eq(true)
    end

    it "returns true for just touching bricks in a line" do
      brick1 = [[0, 2], [2, 2], [3, 3]] # tester
      brick2 = [[2, 4], [2, 2], [2, 2]] # overlapped at ends
      expect(Day22.supported?(brick1, brick2)).to eq(true)
    end

    it "returns true for bricks in a line just past touching" do
      brick1 = [[0, 2], [2, 2], [3, 3]] # tester
      brick2 = [[3, 4], [2, 2], [2, 2]] # beyond overlapped at ends
      expect(Day22.supported?(brick1, brick2)).to eq(false)
    end

    it "returns false for crossed bricks with a z-gap" do
      brick1 = [[0, 2], [2, 2], [4, 4]] # tester
      brick2 = [[1, 1], [0, 2], [2, 2]] # crossed at middle but higher above
      expect(Day22.supported?(brick1, brick2)).to eq(false)
    end

    it "returns false for parallel bricks" do
      brick1 = [[0, 2], [2, 2], [3, 3]] # tester
      brick2 = [[0, 2], [0, 0], [2, 2]] # parallel but not touching
      expect(Day22.supported?(brick1, brick2)).to eq(false)
    end
  end
end
