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
    grid = input.split("\n").map { |line| line.split("") }
    graph = make_graph(grid)

    longest_path = 0
    visited = Set.new

    dfs = -> (node, distance) {
      visited.add(node)

      graph[node].each do |edge|
        distance += edge.last
        child = edge[0..1]
        if !graph.has_key?(child)
          longest_path = [longest_path, distance].max
          break
        end
        dfs.call(child, distance) if !visited.include?(child)
        distance -= edge.last
      end
      visited.delete(node)
    }
    dfs.call([0, 0], 0)

    # Subtract 1 because the first node is not counted
    longest_path - 1
  end

  def self.make_graph(grid)
    start = [[0, 0], [0, 1]]
    target = [grid.length - 1, grid[0].length - 2]
    graph = {[0, 0] => Set.new}
    queue = Queue.new()
    queue.push(start)

    while !queue.empty?
      edge = queue.pop
      row, col = edge.last

      # Find all possible next spaces to explore
      choices = cardinal_neighbors(row, col)
        .filter { |neighbor| grid.dig(*neighbor) != nil }
        .filter { |neighbor| grid.dig(*neighbor) != '#' }
        .filter { |neighbor| !edge.include?(neighbor) }

      # One choice is the most common result i.e., just going down the path
      while choices.length == 1
        next_space = choices.first
        # If the next space is another node, connect the two
        if graph.has_key?(next_space)
          graph[edge.first] << [*next_space, edge.size]
          graph[next_space] << [*edge.first, edge.size]
          choices = []
          next
        end
        edge << next_space
        row, col = next_space

        # End the search if we've reached the target
        if next_space == target
          graph[edge.first] << [*next_space, edge.size - 1]
          choices = []
          break
        end

        # Find all possible next spaces to explore
        choices = cardinal_neighbors(row, col)
          .filter { |neighbor| grid.dig(*neighbor) != nil }
          .filter { |neighbor| grid.dig(*neighbor) != '#' }
          .filter { |neighbor| !edge.include?(neighbor) }
      end
      next if choices.empty?
      # Init the node
      graph[[row, col]] = Set.new if !graph.has_key?([row, col])
      # Define the edges
      graph[edge.first] << [row, col, edge.size - 1]
      graph[[row, col]] << [edge.first[0], edge.first[1], edge.size - 1]
      # Add the next edges to the queue
      choices.each do |next_edge|
        queue.push([[row, col], next_edge])
      end
    end

    graph
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
