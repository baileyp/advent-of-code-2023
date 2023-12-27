class Day21
  def self.part1(input, desired_steps = 64)
    positions, rocks = parse_input(input)

    desired_steps.times do
      new_positions = Set.new
      positions.each do |position|
        cardinal_neighbors(*position).each do |neighbor|
          if !rocks.include?(neighbor)
            new_positions << neighbor
          end
        end
      end
      positions = new_positions
    end
    positions.size
  end

  def self.part2(input)
    nil
  end

  def self.parse_input(input)
    positions = Set.new
    rocks = Set.new
    input.split("\n").each_with_index do |line, row|
      line.split("").each_with_index do |char, col|
        positions << [row, col] if char == "S"
        rocks << [row, col] if char == "#"
      end
    end
    [positions, rocks]
  end

  def self.cardinal_neighbors(row, col)
    [
      [row - 1, col],
      [row, col + 1],
      [row + 1, col],
      [row, col - 1]
    ]
  end
end
