require_relative '../lib/day16'

describe Day16 do
  input = <<~INPUT
    .|...\\....
    |.-.\\.....
    .....|-...
    ........|.
    ..........
    .........\\
    ..../.\\\\..
    .-.-/..|..
    .|....-|.\\
    ..//.|....
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day16.part1(input)).to eq(46)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day16.part2(input)).to eq(51)
    end
  end
end
