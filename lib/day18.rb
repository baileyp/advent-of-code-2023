class Day18
  def self.part1(input)
    lagoon = Set.new
    row, col = 0, 0
    lagoon.add([0, 0])

    parse_input(input).each do |instruction|
      instruction[:distance].times do
        case instruction[:direction]
        when :U
          row -= 1
        when :D
          row += 1
        when :R
          col += 1
        when :L
          col -= 1
        end
        lagoon.add([row, col])
      end
    end

    queue = Queue.new([[1, 1]])
    lagoon.add([1, 1])
    while !queue.empty?
      row, col = queue.pop
      cardinal_neighbors([row, col])
        .filter { |neighbor| !lagoon.include?(neighbor) }
        .each do |neighbor|
          lagoon.add([*neighbor])
          queue.push(neighbor)
        end
    end

    lagoon.size
  end

  def self.part2(input)
    instructions = parse_input_2(input)
    vertices = to_vertices(instructions)
    trench = instructions.map { |instruction| instruction[:distance] }.sum

    return area_of_polygon(vertices).to_i + (trench / 2) + 1
  end

  def self.parse_input(input)
    input.split("\n").map do |line|
      direction, distance, color = line.split
      { direction: direction.to_sym, distance: distance.to_i, color: color[1..-2] }
    end
  end

  def self.parse_input_2(input)
    input.split("\n").map do |line|
      color = line.split.last[2..-2]
      distance = color[0..-2].to_i(16)
      direction = case color[-1]
                  when "0"
                    :R
                  when "1"
                    :D
                  when "2"
                    :L
                  when "3"
                    :U
                  end
      { direction: direction, distance: distance }
    end
  end

  def self.to_vertices(instructions)
    vertices = [[0, 0]]
    row, col = 0, 0
    instructions.each do |instruction|
      distance = instruction[:distance]
      case instruction[:direction]
      when :U
        row -= distance
      when :D
        row += distance
      when :R
        col += distance
      when :L
        col -= distance
      end
      vertices.push([row, col])
    end
    vertices
  end

  def self.cardinal_neighbors(position)
    [
      [position[0] - 1, position[1]],
      [position[0] + 1, position[1]],
      [position[0], position[1] - 1],
      [position[0], position[1] + 1]
    ]
  end

  def self.area_of_polygon(points)
    n = points.size
    area = 0.0

    j = n - 1
    for i in 0...n
      area += (points[j][0] + points[i][0]) * (points[j][1] - points[i][1])
      j = i
    end

    area.abs / 2.0
  end
end
