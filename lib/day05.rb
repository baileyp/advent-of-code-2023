class Day05
  def self.part1(input)
    data = self.parse_input(input)
    data[:seeds].map{ |seed| to_location_number(seed, data[:maps])}.min
  end

  def self.part2(input)
    data = self.parse_input(input)
    seed_ranges = data[:seeds].each_slice(2).map{ |seed1, seed2| [seed1, seed1 + seed2] }

    data[:maps].reduce(seed_ranges) do |ranges, (map_name, map)|
      translate_range(ranges, map)
    end
    .flatten.min
  end

  def self.parse_input(input)
    maps = input.split("\n\n")
    seeds = maps.shift.split(": ").last.split(" ").map(&:to_i)
    maps = maps.map{ |map|
      map = map.split("\n")
      map_name = map.shift.split(" ").first.split("-").last
      [map_name.to_sym, map.map{ |line|
        a, b, c = line.split(" ").map(&:to_i)
        {from: b, to: b + c - 1, offset: a - b}
      }]
    }.to_h
    {seeds: seeds, maps: maps}
  end

  def self.to_location_number(seed, maps)
    num = seed
    maps.each do |_, ranges|
      ranges.each do |range|
        if num.between?(range[:from], range[:to])
          num += range[:offset]
          break
        end
      end
    end
    num
  end

  def self.translate_range(incoming_ranges, translation_map)
    outgoing_ranges = []
    incoming_ranges.each do |from, to|
      translation_map.each do |translation|
        t_from = translation[:from]
        t_to = translation[:to]
        offset = translation[:offset]
        next if to < t_from || from > t_to

        overlap = range_intersection([from, to], [t_from, t_to])
        outgoing_ranges << overlap.map{ |n| n + offset } if overlap
      end

      overhangs = translation_map.reduce([[from, to]]) do |overhangs, translation|
        overhangs
          .map { |overhang| range_difference(overhang, [translation[:from], translation[:to]]) }
          .flatten(1)
      end
      outgoing_ranges += overhangs
    end
    outgoing_ranges
  end

  def self.range_intersection(range1, range2)
    start_point = [range1[0], range2[0]].max
    end_point = [range1[1], range2[1]].min
    start_point > end_point ? nil : [start_point, end_point]
  end

  def self.range_symmetric_difference(range1, range2)
    intersection = self.range_intersection(range1, range2)
    return [range1, range2] unless intersection

    result = []
    result << [range1[0], intersection[0] - 1] if range1[0] < intersection[0]
    result << [intersection[1] + 1, range1[1]] if range1[1] > intersection[1]
    result << [intersection[1] + 1, range2[1]] if range2[1] > intersection[1]
    result
  end

  def self.range_difference(range1, range2)
    intersection = self.range_intersection(range1, range2)
    return [range1] unless intersection

    result = []
    result << [range1[0], intersection[0] - 1] if range1[0] < intersection[0]
    result << [intersection[1] + 1, range1[1]] if range1[1] > intersection[1]
    result
  end
end