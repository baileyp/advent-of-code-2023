require_relative '../lib/day02'

describe Day02 do
  describe ".part1" do
    it "returns the sum of the numbers in the input" do
      input = <<~INPUT
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      INPUT

      expect(Day02.part1(input)).to eq(8)
    end

    describe ".parse_input" do
      it "parses the input correctly" do
        input = "Game 11: 3 blue, 4 red; 1 red, 2 green, 20 blue; 2 green"
        expected_output = {
          game_id: 11,
          sets: [
            { "blue" => 3, "red" => 4 },
            { "red" => 1, "green" => 2, "blue" => 20 },
            { "green" => 2 }
          ]
        }
        expect(Day02.parse_input(input)).to eq(expected_output)
      end
    end
  end
end
