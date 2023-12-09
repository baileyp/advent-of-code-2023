require_relative '../lib/day04'

describe Day04 do
  describe ".part1" do
    it "returns the solution to part 1" do
      input = <<~INPUT
        Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
        Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
        Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
        Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
        Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
        Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
      INPUT

      expect(Day04.part1(input)).to eq(13)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      input = <<~INPUT
        Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
        Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
        Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
        Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
        Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
        Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
      INPUT

      expect(Day04.part2(input)).to eq(30)
    end
  end

  describe ".parse_line" do
    it "parses the input correctly" do
      input1 = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
      expected_output1 = {
        card: 1,
        winning_numbers: [41, 48, 83, 86, 17],
        my_numbers: [83, 86, 6, 31, 17, 9, 48, 53]
      }
      input2 = "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1"
      expected_output2 = {
        card: 3,
        winning_numbers: [1, 21, 53, 59, 44],
        my_numbers: [69, 82, 63, 72, 16, 21, 14, 1]
      }
      expect(Day04.parse_line(input1)).to eq(expected_output1)
      expect(Day04.parse_line(input2)).to eq(expected_output2)
    end
  end

  describe ".parse_line_2" do
    it "parses the input correctly" do
      input1 = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
      expected_output1 = [1, {
        winning_numbers: [41, 48, 83, 86, 17],
        my_numbers: [83, 86, 6, 31, 17, 9, 48, 53],
        copies: 1
      }]
      input2 = "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1"
      expected_output2 = [3, {
        winning_numbers: [1, 21, 53, 59, 44],
        my_numbers: [69, 82, 63, 72, 16, 21, 14, 1],
        copies: 1
      }]
      expect(Day04.parse_line_2(input1)).to eq(expected_output1)
      expect(Day04.parse_line_2(input2)).to eq(expected_output2)
    end
  end

  describe ".find_matching_numbers" do
    it "finds the matching numbers between the winning numbers and my numbers" do
      card1 = {
        card: 1,
        winning_numbers: [41, 48, 83, 86, 17],
        my_numbers: [83, 86, 6, 31, 17, 9, 48, 53]
      }
      expect(Day04.find_matching_numbers(card1).sort).to eq([48, 83, 17, 86].sort)
    end
  end

end
