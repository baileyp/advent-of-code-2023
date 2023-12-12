require 'set'

class Day11
  def self.part1(input, f=2)
    galaxies = expand_space(find_galaxies(input), f)

    distances = {}

    (0..galaxies.length - 1).each do |a|
      (0..galaxies.length - 1).each do |b|
        if a != b && !distances.has_key?([a, b].sort)
          distances[[a, b].sort] = manhattan_distance(galaxies[a], galaxies[b])
        end
      end
    end

    distances.values.sum
  end

  def self.part2(input, f=1000000)
    part1(input, f)
  end

  def self.find_galaxies(input)
    galaxies = []
    input.split("\n").each_with_index do |line, row|
      line.split("").each_with_index do |char, col|
        if char == "#"
          galaxies << [row, col]
        end
      end
    end
    galaxies
  end

  def self.expand_space(galaxies, expansion_factor)
    rows = Set.new(galaxies.map { |g| g[0] })
    row_gaps = Set.new((0..rows.max).to_a) - rows
    columns = Set.new(galaxies.map { |g| g[1] })
    column_gaps = Set.new((0..columns.max).to_a) - columns

    galaxies.map do |galaxy|
      row_offset = row_gaps.filter{ |r| r < galaxy[0] }.length * (expansion_factor - 1)
      col_offset = column_gaps.filter{ |c| c < galaxy[1] }.length * (expansion_factor - 1)
      [galaxy[0] + row_offset, galaxy[1] + col_offset]
    end
  end

  def self.manhattan_distance(a, b)
    (a[0] - b[0]).abs + (a[1] - b[1]).abs
  end
end
