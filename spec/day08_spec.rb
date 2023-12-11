require_relative '../lib/day08'

describe Day08 do
  input = <<~INPUT
    RL

    AAA = (BBB, CCC)
    BBB = (DDD, EEE)
    CCC = (ZZZ, GGG)
    DDD = (DDD, DDD)
    EEE = (EEE, EEE)
    GGG = (GGG, GGG)
    ZZZ = (ZZZ, ZZZ)
  INPUT

  input2 = <<~INPUT
    LLR

    AAA = (BBB, BBB)
    BBB = (AAA, ZZZ)
    ZZZ = (ZZZ, ZZZ)
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day08.part1(input)).to eq(2)
      expect(Day08.part1(input2)).to eq(6)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do

      expect(Day08.part2(input)).to eq(nil)
    end
  end

  describe '.parse_input' do
    it 'calls .parse_instructions and .parse_graph with the correct arguments' do
      allow(Day08).to receive(:parse_instructions).and_return('instructions')
      allow(Day08).to receive(:parse_graph).and_return('graph')

      result = Day08.parse_input("instructions\n\ngraph")

      expect(Day08).to have_received(:parse_instructions).with('instructions')
      expect(Day08).to have_received(:parse_graph).with('graph')
      expect(result).to eq(['instructions', 'graph'])
    end
  end

  describe ".parse_instructions" do
    it "expects to parse the instructions correctly" do
      instructions = Day08.parse_instructions(input.split("\n\n").first)
      expect(instructions.pop).to eq(:R)
      expect(instructions.pop).to eq(:L)
      expect(instructions.empty?).to eq(true)
    end
  end

  describe ".parse_graph" do
    it "expects to parse the graph correctly" do
      parsed = {:AAA=>{:L=>:BBB, :R=>:CCC}, :BBB=>{:L=>:DDD, :R=>:EEE}, :CCC=>{:L=>:ZZZ, :R=>:GGG}, :DDD=>{:L=>:DDD, :R=>:DDD}, :EEE=>{:L=>:EEE, :R=>:EEE}, :GGG=>{:L=>:GGG, :R=>:GGG}, :ZZZ=>{:L=>:ZZZ, :R=>:ZZZ}}
      expect(Day08.parse_graph(input.split("\n\n").last)).to eq(parsed)
    end
  end
end
