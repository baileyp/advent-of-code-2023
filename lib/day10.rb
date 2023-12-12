require 'set'

class Day10
  @@L_TO_R = ['-', '7', 'J', 'S']
  @@R_TO_L = ['-', 'F', 'L', 'S']
  @@D_TO_U = ['|', 'F', '7', 'S']
  @@U_TO_D = ['|', 'J', 'L', 'S']

  def self.part1(input)
    field = input.split("\n")
    start = find_start(field)

    path_length = 1
    curr_location = locate_next_pipe(start, [-1, -1], field)
    from_location = start
    while field[curr_location[0]][curr_location[1]] != 'S' do
      path_length += 1
      next_location = locate_next_pipe(curr_location, from_location, field)
      from_location = curr_location
      curr_location = next_location
    end
    return path_length / 2
  end

  def self.part2(input)
    field = input.split("\n")
    start = find_start(field)
    path = []

    path_length = 1
    curr_location = locate_next_pipe(start, [-1, -1], field)
    path << curr_location
    from_location = start
    while field[curr_location[0]][curr_location[1]] != 'S' do
      path_length += 1
      next_location = locate_next_pipe(curr_location, from_location, field)
      from_location = curr_location
      curr_location = next_location
      path << curr_location
    end

    start_location = path.pop
    start_pipe = determine_start_pipe(path)
    path << start_location

    field = cleanup_field(field, path, start_pipe)
    field.map { |line| ray_cast_count(line) }.sum
  end

  def self.find_start(field)
    field.each_with_index do |line, row|
      if line.include?('S')
        return [row, line.index('S')]
      end
    end
  end

  def self.locate_next_pipe(location, from, field)
    # Look right
    from_pipe = field[from[0]][from[1]]
    location_pipe = field[location[0]][location[1]]
    row, col = [location[0], location[1] + 1]
    if [row, col] != from && col < field[row].length && @@L_TO_R.include?(field[row][col]) && @@R_TO_L.include?(location_pipe)
      return [row, col]
    end

    # Look left
    row, col = [location[0], location[1] - 1]
    if [row, col] != from && col >= 0 && @@R_TO_L.include?(field[row][col]) && @@L_TO_R.include?(location_pipe)
      return [row, col]
    end

    # Look down
    row, col = [location[0] + 1, location[1]]
    if [row, col] != from && row < field.length && @@U_TO_D.include?(field[row][col]) && @@D_TO_U.include?(location_pipe)
      return [row, col]
    end

    # Look up
    row, col = [location[0] - 1, location[1]]
    if [row, col] != from && row >= 0 && @@D_TO_U.include?(field[row][col]) && @@U_TO_D.include?(location_pipe)
      return [row, col]
    end

    raise "No next location found for #{location[0]},#{location[1]} from #{from[0]},#{from[1]}"
  end

  def self.ray_cast_count(line)
    location = :out
    point_count = 0
    along_horizontal = false
    from = nil
    line.each_char do |cell|
      if ['L', 'F'].include?(cell)
        along_horizontal = true
        from = cell == 'L' ? :up : :down
      end
      if cell == '|'
        along_horizontal = false
        location = location == :out ? :in : :out
      end
      if cell == 'J'
        along_horizontal = false
        if from == :down
          location = location == :out ? :in : :out
        end
      end
      if cell == '7'
        along_horizontal = false
        if from == :up
          location = location == :out ? :in : :out
        end
      end
      if cell == '.'
        point_count += 1 if location == :in
      end
    end
    point_count
  end

  def self.cleanup_field(field, path, start_pipe)
    path_as_set = Set.new(path)
    field.map.with_index do |line, row|
      new_line = ''
      line.chars.each_with_index do |cell, col|
        next_char = path_as_set.include?([row, col]) ? cell : '.'
        new_line += next_char == 'S' ? start_pipe : next_char
      end
      new_line
    end
  end

  def self.determine_start_pipe(path)
    from, to = path.first, path.last
    same_row = from[0] == to[0]
    same_col = from[1] == to[1]
    right_of = from[1] < to[1]
    below_of = from[0] < to[0]
    if same_row
       return '-'
    end
    if same_col
      return '|'
    end
    if right_of
      return below_of ? '7' : 'J'
    end
    below_of ? 'F' : 'L'
  end
end
