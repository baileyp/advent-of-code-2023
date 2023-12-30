require_relative './priority_queue'

class Day17
  def self.part1(input)
    grid = input.split("\n").map { |row| row.split('').map(&:to_i) }
    find_lowest_heat(grid)
  end

  def self.part2(input)
    nil
  end

  def self.find_lowest_heat(grid)
    target = [grid.length - 1, grid[0].length - 1]
    queue = PriorityQueue.new()
    queue << [0, [0, 0], :E, 0]
    queue << [0, [0, 0], :S, 0]
    visited = Set.new

    dig = ->(row, col) {
      return nil if row < 0 || col < 0 || row >= grid.length || col >= grid[0].length
      grid[row][col]
    }

    while !queue.empty?
      heat, position, direction, steps = queue.pop
      return heat if position == target

      next if visited.include?([position, direction, steps])
      visited << [position, direction, steps]

      forward, right, left = neighbors(*position, direction)
      heat_right = dig.call(*right[0..1])
      heat_left = dig.call(*left[0..1])
      heat_forward = dig.call(*forward)

      queue << [heat + heat_right, right[0..1], right.last, 1] if heat_right
      queue << [heat + heat_left, left[0..1], left.last, 1] if heat_left
      queue << [heat + heat_forward, forward, direction, steps + 1] if steps < 3 && heat_forward
    end
  end

  def self.neighbors(row, col, direction)
    case direction
    when :E
      [[row, col + 1], # forward
      [row + 1, col, :S], # right
      [row - 1, col, :N]] # left
    when :S
      [[row + 1, col], # forward
      [row, col - 1, :W], # right
      [row, col + 1, :E]] # left
    when :N
      [[row - 1, col], # forward
      [row, col + 1, :E], # right
      [row, col - 1, :W]] # left
    when :W
      [[row, col - 1], # forward
      [row - 1, col, :N], # right
      [row + 1, col, :S]] # left
    end
  end
end

