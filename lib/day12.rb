class Day12
  def self.part1(input)
    data = input
      .split("\n")
      .map{ |line| parse_line(line) }
      .map{ |springs, record| [make_permutations(springs), record] }
      .map{ |permutations, record| permutations.select{ |p| test_condition(p, record) }.length }
      .sum
  end

  def self.part2(input)
    nil
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
end
