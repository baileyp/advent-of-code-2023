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
        current.product(['.', '#']).map(&:join).filter{ |str| test_condition_partial(str, record) }
      else
        current.filter{ |str| test_condition_partial(str, record) }.map { |str| str + char }
      end
    end
    permutations
  end

  def self.test_condition_partial(springs, record)
    found_springs = springs.gsub(/^\.+|\.+$/, '').split(/\.+/).map(&:length)
    sets = found_springs.zip(record)
    sets.pop
    sets.all?{ |found_spring, record| found_spring == record }
  end

  def self.fold(springs, record)
    [Array.new(5) { |i| springs }.join('?'), Array.new(5) { |i| record }.flatten]
  end
end
