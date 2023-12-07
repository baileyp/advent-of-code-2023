class Day04
  # Calculates the solution for part 1 of the Advent of Code Day 4 challenge.
  #
  # @param input [String] The input string containing the card data.
  # @return [Integer] The solution for part 1.
  def self.part1(input)
    input
      .split("\n")
      .map { |line| parse_line(line) }
      .map { |card| find_matching_numbers(card) }
      .filter { |numbers| numbers.length > 0 }
      .map { |numbers| 2 ** (numbers.length - 1) }
      .sum
  end

  # Calculates the solution for part 2 of the Advent of Code Day 4 challenge.
  #
  # @param input [String] The input string containing the card data.
  # @return [Integer] The solution for part 2.
  def self.part2(input)
    nil
  end

  # Parses a line of card data and returns a hash representing the card.
  #
  # @param line [String] The line of card data.
  # @return [Hash] The card represented as a hash.
  def self.parse_line(line)
    parts = line.split(":")
    card = parts[0].split.last.to_i
    numbers = parts[1].split("|").map { |part| part.split.map(&:to_i) }
    {
      card: card,
      winning_numbers: numbers[0],
      my_numbers: numbers[1]
    }
  end

  # Finds the matching numbers between the winning numbers and the player's numbers.
  #
  # @param card [Hash] The card represented as a hash.
  # @return [Array] The array of matching numbers.
  def self.find_matching_numbers(card)
    card[:winning_numbers] & card[:my_numbers]
  end
end
