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
    nil
  end

  def self.parse_input(input)
    input.split("\n").map do |line|
      direction, distance, color = line.split
      { direction: direction.to_sym, distance: distance.to_i, color: color[1..-2] }
    end
  end

  def self.cardinal_neighbors(position)
    [
      [position[0] - 1, position[1]],
      [position[0] + 1, position[1]],
      [position[0], position[1] - 1],
      [position[0], position[1] + 1]
    ]
  end
end
