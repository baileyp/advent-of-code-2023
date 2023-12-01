require_relative '../lib/my_cli'

describe MyCli do
  describe ".run" do
    it "calls the correct part method on the specified day class" do
      allow(File).to receive(:read).with("input/day03.txt").and_return("input content")

      day03_mock = double("Day03")
      expect(day03_mock).to receive(:part2).with("input content")

      allow(Object).to receive(:const_get).with("Day03").and_return(day03_mock)

      MyCli.run(3, 2)
    end

    it "reads the input file for the specified day" do
      allow(File).to receive(:read).with("input/day03.txt").and_return("input content")

      day03_mock = double("Day03")
      expect(day03_mock).to receive(:part2).with("input content")

      allow(Object).to receive(:const_get).with("Day03").and_return(day03_mock)

      MyCli.run(3, 2)
    end
  end
end