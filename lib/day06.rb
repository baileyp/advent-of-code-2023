class Day06
  def self.part1(input)
    races = parse_input(input)
    ways = []
    races.each do |time, distance_record|
      ways << (0..time)
        .map{ |hold| distance_from_time(hold, time)}
        .filter{ |distance| distance > distance_record }
        .length
    end
    ways.inject(:*)
  end

  def self.part2(input)
    time, distance_record = parse_input2(input)
    (0..time)
      .map{ |hold| distance_from_time(hold, time)}
      .filter{ |distance| distance > distance_record }
      .length
  end

  def self.parse_input(input)
    lines = input.split("\n")
    times = lines[0].split(": ").last.split.map(&:to_i)
    distances = lines[1].split(": ").last.split.map(&:to_i)
    times.zip(distances)
  end

  def self.parse_input2(input)
    lines = input.split("\n")
    times = lines[0].split(": ").last.gsub(/\s+/, "")
    distances = lines[1].split(": ").last.gsub(/\s+/, "")
    [times.to_i, distances.to_i]
  end

  def self.distance_from_time(hold, limit)
    (limit - hold) * hold
  end
end