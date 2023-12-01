# lib/day01.rb

class Day01
  def self.part1(input)
    input.each_line.map{ |line| combine_integers(line.chomp)}.sum
  end

  def self.part2(input)
    input.each_line
      .map{ |line| reduce_to_first_and_last_digit(line.chomp) }
      .map{ |line| number_names_to_digits(line).to_i}
      .sum
  end

  def self.combine_integers(str)
    numbers = str.scan(/\d/).map(&:to_i)
    "#{numbers[0]}#{numbers[numbers.size - 1]}".to_i
  end

  def self.number_names_to_digits(str)
    str.gsub(/one/, '1')
       .gsub(/two/, '2')
       .gsub(/three/, '3')
       .gsub(/four/, '4')
       .gsub(/five/, '5')
       .gsub(/six/, '6')
       .gsub(/seven/, '7')
       .gsub(/eight/, '8')
       .gsub(/nine/, '9')
  end

  def self.reduce_to_first_and_last_digit(str)
    number_names = %w[one two three four five six seven eight nine 1 2 3 4 5 6 7 8 9]
    first_occurence_hash = number_names.filter_map{ |name| [str.index(name), name] if str.include?(name) }.to_h
    last_occurence_hash = number_names.filter_map{ |name| [str.rindex(name), name] if str.include?(name) }.to_h
    "#{first_occurence_hash[first_occurence_hash.keys.min]}#{last_occurence_hash[last_occurence_hash.keys.max]}"
  end
end
