require_relative '../lib/day24'
require 'matrix'

describe Day24 do
  input = <<~INPUT
    19, 13, 30 @ -2,  1, -2
    18, 19, 22 @ -1, -1, -2
    20, 25, 34 @ -2, -2, -4
    12, 31, 28 @ -1, -2, -1
    20, 19, 15 @  1, -5, -3
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day24.part1(input, [7, 27])).to eq(2)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day24.part2(input)).to eq(nil)
    end
  end

  describe ".parse_line" do
    it "returns a tuple of position and velocity" do
      expect(Day24.parse_line("19, 13, 30 @ -2,  1, -2")).to eq([[19, 13, 30], [-2, 1, -2]])
    end
  end

  describe ".intersection_point_2d" do
    it "returns the intersection point of two lines" do
      m1 = Matrix[[19, 13], [-2, 1]]
      m2 = Matrix[[18, 19], [-1, -1]]
      m3 = Matrix[[20, 25], [-2, -2]]
      m4 = Matrix[[12, 31], [-1, -2]]
      m5 = Matrix[[20, 19], [1, -5]]

      expect(Day24.intersection_point_2d(m1, m2)).to eq([14.333, 15.333])
      expect(Day24.intersection_point_2d(m1, m3)).to eq([11.667, 16.667])
      expect(Day24.intersection_point_2d(m1, m4)).to eq([6.2, 19.4])
      expect(Day24.intersection_point_2d(m3, m4)).to eq([-2, 3])
      expect(Day24.intersection_point_2d(m2, m4)).to eq([-6, -5])
    end

    it "returns nil if the lines are parallel" do
      m1 = Matrix[[18, 19], [-1, -1]]
      m2 = Matrix[[20, 25], [-2, -2]]

      expect(Day24.intersection_point_2d(m1, m2)).to eq(nil)
    end
  end

  describe ".intersect_in_future" do
    it "returns true if the intersection is in the future" do
      m1 = Matrix[[19, 13], [-2, 1]]
      m2 = Matrix[[18, 19], [-1, -1]]
      m3 = Matrix[[20, 25], [-2, -2]]
      m4 = Matrix[[12, 31], [-1, -2]]
      m5 = Matrix[[20, 19], [1, -5]]

      expect(Day24.intersect_in_future(m1, m2, [14.333, 15.333])).to eq(true)
      expect(Day24.intersect_in_future(m1, m5, [21.444, 11.778])).to eq(false)
    end
  end
end
