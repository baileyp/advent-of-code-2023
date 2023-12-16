class Day16
  def self.part1(input)
    width, height, contraption = parse_input(input)
    beams = [[0, -1, :right]]
    energized = Hash.new{ |h, k| h[k] = []}

    while beams.length > 0
      beams = beams.reduce([]) do |memo, beam|
        row, col, heading = beam
        case heading
        when :right
          col += 1
        when :down
          row += 1
        when :left
          col -= 1
        when :up
          row -= 1
        end
        out_of_bounds = row < 0 || row >= height || col < 0 || col >= width
        if !out_of_bounds
          case contraption[[row, col]]
          when '|'
            if heading == :right || heading == :left
              memo << [row, col, :down]
              memo << [row, col, :up]
            else
              memo << [row, col, heading]
            end
          when '-'
            if heading == :right || heading == :left
              memo << [row, col, heading]
            else
              memo << [row, col, :right]
              memo << [row, col, :left]
            end
          when '/'
            if heading == :right
              memo << [row, col, :up]
            elsif heading == :down
              memo << [row, col, :left]
            elsif heading == :left
              memo << [row, col, :down]
            elsif heading == :up
              memo << [row, col, :right]
            end
          when '\\'
            if heading == :right
              memo << [row, col, :down]
            elsif heading == :down
              memo << [row, col, :right]
            elsif heading == :left
              memo << [row, col, :up]
            elsif heading == :up
              memo << [row, col, :left]
            end
          when nil
            memo << [row, col, heading]
          end
        end
        memo
      end

      # Beams can cycle so eliminate already-seen vectors
      beams.filter!{ |b| !energized[[b[0], b[1]]].include?(b[2])}
      beams.each{ |b| energized[[b[0], b[1]]] << b[2]}
    end
    energized.length
  end

  def self.part2(input)
    nil
  end

  def self.parse_input(input)
    lines = input.split(/\n/)
    width = lines.first.length
    height = lines.length
    contraption = {}
    lines.each_with_index do |line, row|
      line.chars.each_with_index do |char, col|
        contraption[[row, col]] = char if char != '.'
      end
    end
    [width, height, contraption]
  end
end
