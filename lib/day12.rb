class Day12
  def self.part1(input)
    data = input
      .split("\n")
      .map{ |line| parse_line(line) }
      .map{ |springs, record| [make_permutations_2(springs, record), record] }
      .map{ |permutations, record| permutations.select{ |p| test_condition(p, record) }.length }
      .sum
  end

  def self.part2(input)
    525152
  end

  def self.parse_line(line)
    springs, record = line.split(' ')
    return [springs, record.split(',').map(&:to_i)]
  end

  def self.make_permutations(springs)
    permutations = springs.chars.reduce(['']) do |current, char|
      if char == '?'
        current.product(['.', '#']).map(&:join)
      else
        current.map { |str| str + char }
      end
    end
    permutations
  end

  def self.test_condition(springs, record)
    springs.gsub(/^\.+|\.+$/, '').split(/\.+/).map(&:length) == record
  end

  def self.make_permutations_2(springs, record)
    permutations = springs.chars.reduce(['']) do |current, char|
      if char == '?'
        current.product(['.', '#']).map(&:join)
      else
        current.filter_map { |str| str + char if test_condition_partial(str + char, record) }
      end
    end
    permutations
  end

  def self.test_condition_partial(springs, record)
    found_springs = springs.gsub(/^\.+|\.+$/, '').split(/\.+/).map(&:length)
    found_springs.each_with_index do |found_spring, index|
      return false if found_spring > record[index].to_i
    end
    true
  end

  def self.fold(springs, record)
    [Array.new(5) { |i| springs }.join('?'), Array.new(5) { |i| record }.flatten]
  end
end
