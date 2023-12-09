class Day05
  def self.part1(input)
    data = self.parse_input(input)
    data[:seeds].map{ |seed| to_location_number(seed, data[:maps])}.min
  end

  def self.part2(input)
    data = self.parse_input(input)
    locations = []
    (0..data[:seeds].length - 1).step(2) do |i|
      from, range = data[:seeds][i], data[:seeds][i + 1]
      locations << (from..(from + range)).map{ |seed| to_location_number(seed, data[:maps])}.min
    end
    locations.min
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
end