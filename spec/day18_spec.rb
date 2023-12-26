require_relative '../lib/day18'

describe Day18 do
  input = <<~INPUT
    R 6 (#70c710)
    D 5 (#0dc571)
    L 2 (#5713f0)
    D 2 (#d2c081)
    R 2 (#59c680)
    D 2 (#411b91)
    L 5 (#8ceee2)
    U 2 (#caa173)
    L 1 (#1b58a2)
    U 2 (#caa171)
    R 2 (#7807d2)
    U 3 (#a77fa3)
    L 2 (#015232)
    U 2 (#7a21e3)
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day18.part1(input)).to eq(62)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day18.part2(input)).to eq(952408144115)
    end
  end

  describe ".parse_input" do
    it "returns an array of instructions" do
      expect(Day18.parse_input(input)).to eq([
        { direction: :R, distance: 6, color: "#70c710" },
        { direction: :D, distance: 5, color: "#0dc571" },
        { direction: :L, distance: 2, color: "#5713f0" },
        { direction: :D, distance: 2, color: "#d2c081" },
        { direction: :R, distance: 2, color: "#59c680" },
        { direction: :D, distance: 2, color: "#411b91" },
        { direction: :L, distance: 5, color: "#8ceee2" },
        { direction: :U, distance: 2, color: "#caa173" },
        { direction: :L, distance: 1, color: "#1b58a2" },
        { direction: :U, distance: 2, color: "#caa171" },
        { direction: :R, distance: 2, color: "#7807d2" },
        { direction: :U, distance: 3, color: "#a77fa3" },
        { direction: :L, distance: 2, color: "#015232" },
        { direction: :U, distance: 2, color: "#7a21e3" }
      ])
    end
  end

  describe ".parse_input_2" do
    it "returns an array of instructions for part 2" do
      expect(Day18.parse_input_2(input)).to eq([
        { direction: :R, distance: 461937 },
        { direction: :D, distance: 56407 },
        { direction: :R, distance: 356671 },
        { direction: :D, distance: 863240 },
        { direction: :R, distance: 367720 },
        { direction: :D, distance: 266681 },
        { direction: :L, distance: 577262 },
        { direction: :U, distance: 829975 },
        { direction: :L, distance: 112010 },
        { direction: :D, distance: 829975 },
        { direction: :L, distance: 491645 },
        { direction: :U, distance: 686074 },
        { direction: :L, distance: 5411 },
        { direction: :U, distance: 500254 },
      ])
    end
  end
end
