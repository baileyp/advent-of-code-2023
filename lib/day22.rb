class Day22
  def self.part1(input)
    bricks = input
      .split("\n")
      .map { |line| parse_line(line) }
      .sort{ |a, b| a[2][0] <=> b[2][0] }

    stack = []
    bricks.each do |brick|
      x, y, z = brick
      # Drop each brick until it is supported or hits the bottom
      while true
        break if z.min == 1
        supporting = stack
          # Find all bricks that are one level below the current brick
          .filter{ |b| b[2].max == z.min - 1 }
          # Get just the brick
          .map{ |b| b[0..2] }
          # Filter to only those that are actually supporting the current brick
          .filter{ |b| supported?([x, y, z], b) }
        break if supporting.length > 0
        z.map!(&:pred)
      end
      stack << [x, y, z, supporting || []]
    end

    # Bricks that are unsafe to disintegrate are those that are the only supporter of a brick above them
    unsafe_bricks = stack.filter{ |b| b[3].length == 1 }.map{ |b| b[3].flatten }.uniq
    return stack.length - unsafe_bricks.length
  end

  def self.part2(input)
    nil
  end

  def self.parse_line(line)
    from, to = line
      .split("~")
      .map{ |s| s.split(",").map(&:to_i) }
    from.zip(to)
  end

  def self.supported?(supportee, supporter)
    x1, y1, z1 = supportee
    x2, y2, z2 = supporter

    # Bricks too far apart
    return false if z2.max + 1 < z1.min

    # Supportee is already below supporter
    return false if z1.min <= z2.max

    # Check if x or y are covered
    x_covered = covered?(x1, x2)
    y_covered = covered?(y1, y2)

    # Special cases for parallel bricks
    if x1.uniq.length == 1 && x2.uniq.length == 1
      return x1 == x2 ? y_covered : false
    end
    if y1.uniq.length == 1 && y2.uniq.length == 1
      return y1 == y2 ? x_covered : false
    end

    x_covered || y_covered
  end

  def self.covered?(p1, p2)
    range1 = (p1[0]..p1[1])
    range2 = (p2[0]..p2[1])
    range1.cover?(range2.first) || range2.cover?(range1.first)
  end
end
