# spec/day01_spec.rb

require_relative '../lib/day01'

describe Day01 do
  describe ".part1" do
    it "returns the sum of the numbers in the input" do
      input = <<~INPUT
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
      INPUT

      expect(Day01.part1(input)).to eq(142)
    end
  end
end