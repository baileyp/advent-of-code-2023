# lib/day01.rb

class Day01
  def self.part1(input)
    input.each_line.map{ |line| combine_integers(line.chomp)}.sum
  end

  def self.part2(input)
    input.each_line.map{ |line| combine_integers(number_names_to_digits(line).chomp)}.sum
  end

  def self.combine_integers(str)
    numbers = str.scan(/\d/).map(&:to_i)
    "#{numbers[0]}#{numbers[numbers.size - 1]}".to_i
  end
end
