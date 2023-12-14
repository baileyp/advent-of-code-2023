require_relative 'day13'

class Day14
  def self.part1(input)
    rotated = Day13.rotate_pattern(input)
    tilted = Day13.rotate_pattern(rotated
      .split("\n")
      .map{ |line| tilt_line(line) }
      .join("\n"))

    tilted
      .split("\n")
      .map.with_index{ |line, i| line.scan(/O/).count * (i + 1) }
      .sum
  end

  def self.part2(input)
    configurations = {}
    configuration = cycle(input)
    iteration = 1

    while !configurations.has_key?(configuration.to_sym)
      configurations[configuration.to_sym] = iteration
      configuration = cycle(configuration)
      iteration += 1
    end

    offset = configurations[configuration.to_sym]
    period = iteration - offset

    ((1_000_000_000 - offset) % period).times do
      configuration = cycle(configuration)
    end

    configuration
      .split("\n")
      .reverse
      .map.with_index{ |line, i| line.scan(/O/).count * (i + 1) }
      .sum
  end

  def self.cycle(input)
    field = input
    4.times do
      field = Day13.rotate_pattern(field)
        .split("\n")
        .map{ |line| tilt_line(line) }
        .join("\n")
    end
    field
  end

  def self.tilt_line(line)
    line
      .scan(/#*[.O]*/)
      .map(&:chars)
      .map(&:sort)
      .map(&:join)
      .join
  end
end
