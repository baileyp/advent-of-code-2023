require_relative '../lib/day20'

describe Day20 do
  input = <<~INPUT
    broadcaster -> a, b, c
    %a -> b
    %b -> c
    %c -> inv
    &inv -> a
  INPUT

  input2 = <<~INPUT
    broadcaster -> a
    %a -> inv, con
    &inv -> b
    %b -> con
    &con -> output
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day20.part1(input)).to eq(32000000)
    end

    it "returns the solution to part 1 with 2nd sample" do
      expect(Day20.part1(input2)).to eq(11687500)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day20.part2(input)).to eq(nil)
    end
  end

  describe ".parse_input" do
    it "returns a hash of wires and their dependencies" do
      expect(Day20.parse_input(input)).to eq({
        broadcaster: [:a, :b, :c],
        flipflop: {a: [:b], b: [:c], c: [:inv]},
        conjunction: {inv: [:a]}
      })
    end
  end
end
