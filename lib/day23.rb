class Day23
  def self.part1(input)
    grid = input.split("\n").map { |line| line.split("") }
    longest_path = 0
    visited = Set.new
    target = [grid.length - 1, grid[0].length - 2]

    dfs = -> (row, col) {
      return if grid[row][col] == "#"
      return if visited.include?([row, col])

      if [row, col] == target
        longest_path = [longest_path, visited.length].max
        return
      end

      visited.add([row, col])

      case grid[row][col]
      when ">"
        dfs.call(row, col + 1)
      when "<"
        dfs.call(row, col - 1)
      when "^"
        dfs.call(row - 1, col)
      when "v"
        dfs.call(row + 1, col)
      else
        cardinal_neighbors(row, col)
          .filter { |row, col| row >= 0 && col >= 0 }
          .filter { |row, col| row < grid.length && col < grid[0].length }
          .each { |row, col| dfs.call(row, col) }
      end

      visited.delete([row, col])
    }

    dfs.call(0, 1)
    longest_path
  end

  def self.part2(input)
    nil
  end

  def self.cardinal_neighbors(row, col)
    [
      [row - 1, col],
      [row + 1, col],
      [row, col - 1],
      [row, col + 1]
    ]
  end
end
