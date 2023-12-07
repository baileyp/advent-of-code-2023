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
    scratchcards = input
      .split("\n")
      .map { |line| parse_line_2(line) }
      .to_h
    scratchcards.each do |card_number, card|
      num_matches = find_matching_numbers(card).length
      (1..num_matches).each do |i|
        scratchcards[card_number + i][:copies] += card.dig(:copies)
      end
    end
    scratchcards.map { |card_number, card| card[:copies] }.sum
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

  # Parses a line of input and returns a hash containing the card number, winning numbers, my numbers, and copies.
  #
  # @param line [String] The input line to parse.
  # @return [Hash] The parsed data as a hash.
  def self.parse_line_2(line)
    parts = line.split(":")
    card = parts[0].split.last.to_i
    numbers = parts[1].split("|").map { |part| part.split.map(&:to_i) }
    [card, {
      winning_numbers: numbers[0],
      my_numbers: numbers[1],
      copies: 1
    }]
  end

  # Finds the matching numbers between the winning numbers and the player's numbers.
  #
  # @param card [Hash] The card represented as a hash.
  # @return [Array] The array of matching numbers.
  def self.find_matching_numbers(card)
    card[:winning_numbers] & card[:my_numbers]
  end
end
