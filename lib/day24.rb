require 'matrix'

class Day24
  def self.part1(input, test_area = [200000000000000, 400000000000000])
    hailstones = input.lines.map { |line| parse_line(line) }
    intersections = {}

    # Get all unique pairs of hailstones
    combinations = hailstones
      .map{ |h| [h[0][0..1], h[1][0..1]] }
      .product(hailstones)
      .filter{ |h| h.first != h.last }
      .map{ |h| h.sort }
      .uniq

    # For each pair of hailstones, find valid intersections
    combinations.each do |hailstone_pair|
      m1 = Matrix[*hailstone_pair.first]
      m2 = Matrix[*hailstone_pair.last]
      intersection = intersection_point_2d(m1, m2)
      if intersection
        next unless intersect_in_future(m1, m2, intersection)
        next unless intersection[0].between?(test_area[0], test_area[1])
        next unless intersection[1].between?(test_area[0], test_area[1])
        intersections[intersection] = intersection
      end
    end
    intersections.length
  end

  def self.part2(input)
    nil
  end

  def self.parse_line(line)
    line.scan(/-?\d+/).map(&:to_i).each_slice(3).to_a
  end

  def self.intersection_point_2d(m1, m2)
    x1, y1, dx1, dy1 = m1[0, 0].to_f, m1[0, 1].to_f, m1[1, 0].to_f, m1[1, 1].to_f
    x2, y2, dx2, dy2 = m2[0, 0].to_f, m2[0, 1].to_f, m2[1, 0].to_f, m2[1, 1].to_f

    denom = dx1*dy2 - dy1*dx2
    return nil if denom.zero?  # The lines are parallel and do not intersect

    t1 = ((x2 - x1) * dy2 - (y2 - y1) * dx2) / denom

    [(x1 + t1 * dx1).round(3), (y1 + t1 * dy1).round(3)]
  end

  def self.intersect_in_future(m1, m2, intersection)
    x1, y1, dx1, dy1 = m1[0, 0].to_f, m1[0, 1].to_f, m1[1, 0].to_f, m1[1, 1].to_f
    x2, y2, dx2, dy2 = m2[0, 0].to_f, m2[0, 1].to_f, m2[1, 0].to_f, m2[1, 1].to_f
    ix, iy = intersection

    return false if dx1 < 0 && ix > x1
    return false if dx1 > 0 && ix < x1
    return false if dy1 < 0 && iy > y1
    return false if dy1 > 0 && iy < y1
    return false if dx2 < 0 && ix > x2
    return false if dx2 > 0 && ix < x2
    return false if dy2 < 0 && iy > y2
    return false if dy2 > 0 && iy < y2

    true
  end
end
