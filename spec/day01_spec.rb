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

    it "only selects single digits at a time" do
      input = <<~INPUT
        ab12cd
        wx45yz
      INPUT

      expect(Day01.part1(input)).to eq(57)
    end
  end

  describe ".part2" do
    it "returns the sum of the numbers in the input" do
      input = <<~INPUT
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
      INPUT

      expect(Day01.part2(input)).to eq(281)
    end
  end

  describe ".combine_integers" do
    it "combines the first and last integers in the string" do
      expect(Day01.combine_integers("1abc2")).to eq(12)
    end

    it "combines the first and last integers in the string containing multiple integers" do
      expect(Day01.combine_integers("ab12cd")).to eq(12)
    end

    it "combines the first and last integers in the string containing no integers" do
      expect(Day01.combine_integers("abcdef")).to eq(0)
    end
  end

  describe ".reduce_to_first_and_last_digit" do
    it "returns the string with only the first and last digits" do
      expect(Day01.reduce_to_first_and_last_digit("1abc2")).to eq("12")
    end

    it "returns the string with only the first and last digits when multiple digits are present" do
      expect(Day01.reduce_to_first_and_last_digit("ab12cd")).to eq("12")
    end

    it "returns the digits even when they're written as words" do
      expect(Day01.reduce_to_first_and_last_digit("eightwothree")).to eq("eightthree")
    end

    it "properly identifies the last digit" do
      expect(Day01.reduce_to_first_and_last_digit("onefourthreefour")).to eq("onefour")
    end

    it "returns an empty string when no digits are present" do
      expect(Day01.reduce_to_first_and_last_digit("abcdef")).to eq("")
    end
  end

end