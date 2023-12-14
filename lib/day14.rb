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
    nil
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
