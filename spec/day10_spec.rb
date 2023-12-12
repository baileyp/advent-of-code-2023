require_relative '../lib/day10'

describe Day10 do
  input = <<~INPUT
    7-F7-
    .FJ|7
    SJLL7
    |F--J
    LJ.LJ
  INPUT

  input2 = <<~INPUT
    FF7FSF7F7F7F7F7F---7
    L|LJ||||||||||||F--J
    FL-7LJLJ||||||LJL-77
    F--JF--7||LJLJ7F7FJ-
    L---JF-JLJ.||-FJLJJ7
    |F|F-JF---7F7-L7L|7|
    |FFJF7L7F-JF7|JL---7
    7-L-JL7||F7|L7F-7F7|
    L.L7LFJ|||||FJL7||LJ
    L7JLJL-JLJLJL--JLJ.L
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day10.part1(input)).to eq(8)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day10.part2(input2)).to eq(10)
    end
  end

  describe ".locate_next_pipe" do
    it "returns the start location" do
      field = <<~FIELD
        S-7
        |.|
        L-J
      FIELD
      field = field.split("\n")
      expect(Day10.locate_next_pipe([0, 0], [-1, -1], field)).to eq([0, 1])
      expect(Day10.locate_next_pipe([0, 1], [0, 0], field)).to eq([0, 2])
      expect(Day10.locate_next_pipe([0, 2], [0, 1], field)).to eq([1, 2])
      expect(Day10.locate_next_pipe([1, 2], [0, 2], field)).to eq([2, 2])
      expect(Day10.locate_next_pipe([2, 2], [1, 2], field)).to eq([2, 1])
      expect(Day10.locate_next_pipe([2, 1], [2, 2], field)).to eq([2, 0])
      expect(Day10.locate_next_pipe([2, 0], [2, 1], field)).to eq([1, 0])
      expect(Day10.locate_next_pipe([1, 0], [2, 0], field)).to eq([0, 0])
    end

    it "doesn't loop back" do
      field = <<~FIELD
        S---7
        L---J
      FIELD
      field = field.split("\n")
      expect(Day10.locate_next_pipe([0, 1], [0, 0], field)).to eq([0, 2])
      expect(Day10.locate_next_pipe([0, 1], [0, 2], field)).to eq([0, 0])
    end
  end

  describe ".ray_cast_count" do
    it "counts the number of points inside the implied polygon" do
      expect(Day10.ray_cast_count('.|..|.|..|.')).to eq(4)
      expect(Day10.ray_cast_count('.|L-7F-J|.')).to eq(0)
      expect(Day10.ray_cast_count('.L--J.L--J.')).to eq(0)
      expect(Day10.ray_cast_count('L--J.L7...LJF7F-7L7.')).to eq(3)
      expect(Day10.ray_cast_count('L---JF-JLJ....FJLJ..')).to eq(4)
    end
  end

  describe ".cleanup_field" do
    it "cleans loose pipe segments from the field and sets the start pipe correctly" do
      field = <<~FIELD
        S--7
        |.-|
        L--J
      FIELD
      field = field.split("\n")
      path = Set.new
      path.add([0, 0])
      path.add([0, 1])
      path.add([0, 2])
      path.add([0, 3])
      path.add([1, 0])
      path.add([1, 3])
      path.add([2, 0])
      path.add([2, 1])
      path.add([2, 2])
      path.add([2, 3])
      expect(Day10.cleanup_field(field, path, 'F')).to eq([
        "F--7",
        "|..|",
        "L--J"
      ])
    end
  end
end
