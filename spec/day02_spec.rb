require_relative '../lib/day02'

describe Day02 do
  describe ".part1" do
    it "returns the solution to part 1" do
      input = <<~INPUT
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      INPUT

      expect(Day02.part1(input)).to eq(8)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      input = <<~INPUT
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
      INPUT

      expect(Day02.part2(input)).to eq(2286)
    end
  end

  describe ".parse_input" do
    it "parses the input correctly" do
      input1 = "Game 11: 3 blue, 4 red; 1 red, 2 green, 20 blue; 2 green"
      expected_output1 = {
        game_id: 11,
        sets: { "blue" => [3, 20], "red" => [4, 1], "green" => [2, 2] }
      }
      input2 = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
      expected_output2 = {
        game_id: 3,
        sets: { "blue" => [6, 5], "red" => [20, 4, 1], "green" => [8, 13, 5] }
      }
      expect(Day02.parse_input(input1)).to eq(expected_output1)
      expect(Day02.parse_input(input2)).to eq(expected_output2)
    end
  end

  describe ".is_game_possible" do
    it "correctly determines if a game is possible for a given bag" do
      game1 = {
        game_id: 1,
        sets: { "blue" => [3, 6], "red" => [4, 1], "green" => [2] }
      }
      game3 = {
        game_id: 3,
        sets: { "blue" => [6, 5], "red" => [20, 4, 1], "green" => [8, 13, 5] }
      }
      bag = { red: 12, green: 13, blue: 14 }
      expect(Day02.is_game_possible(game1, bag)).to eq(true)
      expect(Day02.is_game_possible(game3, bag)).to eq(false)
    end
  end

  describe ".min_colors_needed" do
    it "returns a hash with the minimum counts of each color in a game" do
      game = {
        game_id: 1,
        sets: { "blue" => [3, 6], "red" => [4, 1], "green" => [2] }
      }
      expected_output = { "blue" => 6, "red" => 4, "green" => 2 }
      expect(Day02.min_colors_needed(game)).to eq(expected_output)
    end
  end
end