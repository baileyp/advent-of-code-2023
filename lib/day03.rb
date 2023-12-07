class Day03
  @@digits = %w[0 1 2 3 4 5 6 7 8 9]
  @@symbols = %w[% = # @ & $ * + / -]

  def self.part1(input)
    grid = input.split("\n")
    numbers = []
    (0..grid.length - 1).each do |row|
      current_number = ""
      is_adjacent = false
      (0..grid[row].length - 1).each do |col|
        cell = grid[row][col]
        if @@digits.include?(cell)
          current_number += cell
          digit_is_adjacent = neighbors(row, col).any? { |neighbor| @@symbols.include?(grid[neighbor[0]]&.[](neighbor[1])) }
          is_adjacent = is_adjacent || digit_is_adjacent
        else
          numbers << current_number.to_i if current_number != "" && is_adjacent
          current_number = ""
          is_adjacent = false
        end
      end
      numbers << current_number.to_i if current_number != "" && is_adjacent
    end
    numbers.sum
  end

  def self.part2(input)
    grid = input.split("\n")
    gear_location = []
    gears = {}
    (0..grid.length - 1).each do |row|
      current_number = ""
      is_adjacent = false
      (0..grid[row].length - 1).each do |col|
        cell = grid[row][col]
        if @@digits.include?(cell)
          current_number += cell
          neighbors = neighbors(row, col).each do |neighbor|
            if grid[neighbor[0]]&.[](neighbor[1]) == '*'
              gear_location = [neighbor[0], neighbor[1]]
              is_adjacent = true
            end
          end
        else
          if is_adjacent
            if gears[gear_location].nil?
              gears[gear_location] = []
            end
            gears[gear_location] << current_number.to_i
          end
          gear_location = []
          is_adjacent = false
          current_number = ""
        end
      end
      if is_adjacent
        if gears[gear_location].nil?
          gears[gear_location] = []
        end
        gears[gear_location] << current_number.to_i
      end
      gear_location = []
      is_adjacent = false
      current_number = ""
    end
    gears.values.filter_map do |gear| gear.inject(:*) if gear.length == 2 end.sum
  end

  def self.neighbors(row, col)
    offsets = [-1, 0, 1]
    result = []

    offsets.each do |row_offset|
      offsets.each do |col_offset|
        next if row_offset == 0 && col_offset == 0

        neighbor_row = row + row_offset
        neighbor_col = col + col_offset
        result << [neighbor_row, neighbor_col]
      end
    end

    result
  end
end
