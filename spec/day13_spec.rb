require_relative '../lib/day13'

describe Day13 do
  input = <<~INPUT
    #.##..##.
    ..#.##.#.
    ##......#
    ##......#
    ..#.##.#.
    ..##..##.
    #.#.##.#.

    #...##..#
    #....#..#
    ..##..###
    #####.##.
    #####.##.
    ..##..###
    #....#..#
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day13.part1(input)).to eq(405)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day13.part2(input)).to eq(nil)
    end
  end

  describe ".find_fold" do
    it "finds the fold in a simple pattern" do
      pattern = <<~PATTERN
        ...
        #.#
        #.#
      PATTERN
      lines = pattern.strip.split("\n")
      expect(Day13.find_fold(lines)).to eq(1)
    end

    it "finds the fold in a complex pattern" do
      pattern = <<~PATTERN
        #..#..#..##..#.
        ...#..##.##.#..
        ###.#.########.
        ##.#...##..##..
        #.####...##...#
        .####.#.####.#.
        ##.##..######..
        .####..#....#..
        .##.##.##..##.#
        ..#.##...##...#
        #.#.#.##.##.##.
        #####.#.#..#.#.
        ...##...####...
        #.#..##.#..#.##
        .####.#.####.#.
        .####.#.####.#.
        #.#..##.#..#.##
      PATTERN
      lines = pattern.strip.split("\n")
      expect(Day13.find_fold(lines)).to eq(14)
    end

    it "finds the fold in another complex pattern" do
      pattern = <<~PATTERN
        ....#...####..#
        .###.....####.#
        ###.#.##..#.#..
        #.#.######...#.
        #.#####.#..#.#.
        ...#......#.##.
        ####....#......
        #.#..#..#####.#
        ##..#.##...#.##
        ...#.#.###.###.
        ..####.##...#.#
        ..####.##...#.#
        ...#.#..##.###.
        ...#.#..##.###.
        ..####.##...#.#
        ..####.##...#.#
        ...#.#.###.###.
      PATTERN
      lines = pattern.strip.split("\n")
      expect(Day13.find_fold(lines)).to eq(12)
    end

    it "finds the fold on the first line" do
      pattern = <<~PATTERN
        ..#....########
        ..#....########
        .#.##.#...##...
        .###.#.###.####
        #...#...#.##.#.
        ##..####.####.#
        ##..##.##.##.##
        #...#.####..###
        ##.#.###.#..#.#
      PATTERN
      lines = pattern.strip.split("\n")
      expect(Day13.find_fold(lines)).to eq(0)
    end
  end

  describe ".rotate_pattern" do
    it "rotates the pattern 90 degrees clockwise" do
      original = <<~PATTERN
        ##.
        ..#
        .#.
      PATTERN
      rotated = <<~PATTERN
        ..#
        #.#
        .#.
      PATTERN
      expect(Day13.rotate_pattern(original)).to eq(rotated)
    end
  end
end
