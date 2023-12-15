require_relative '../lib/day15'

describe Day15 do
  input = <<~INPUT
    rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day15.part1(input)).to eq(1320)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day15.part2(input)).to eq(145)
    end
  end

  describe ".hash_algo" do
    it "returns the HASH of a string" do
      expect(Day15.hash_algo("rn=1")).to eq(30)
      expect(Day15.hash_algo("cm-")).to eq(253)
      expect(Day15.hash_algo("qp=3")).to eq(97)
      expect(Day15.hash_algo("cm=2")).to eq(47)
      expect(Day15.hash_algo("qp-")).to eq(14)
      expect(Day15.hash_algo("pc=4")).to eq(180)
      expect(Day15.hash_algo("ot=9")).to eq(9)
      expect(Day15.hash_algo("ab=5")).to eq(197)
      expect(Day15.hash_algo("pc-")).to eq(48)
      expect(Day15.hash_algo("pc=6")).to eq(214)
      expect(Day15.hash_algo("ot=7")).to eq(231)
    end
  end
end
