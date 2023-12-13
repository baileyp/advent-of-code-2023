class Day13
  def self.part1(input)
    patterns = input
      .split("\n\n")
      .map.with_index{ |pattern, id| [id, pattern] }

    horizontal_scores = patterns
      .map{ |id, pattern| [id, find_fold(pattern.strip.split("\n")) + 1] }
      .map{ |id, score| [id, score * 100] }
      .to_h

    vertical_scores = patterns
      .filter_map{ |id, pattern| [id, rotate_pattern(pattern)] if horizontal_scores[id] == 0 }
      .map{ |id, pattern| [id, find_fold(pattern.strip.split("\n")) + 1] }
      .to_h

    [horizontal_scores.values, vertical_scores.values].flatten.sum
  end

  def self.part2(input)
    nil
  end

  def self.find_fold(lines)
    (0...lines.length - 1).each do |row|
      top_half = lines[0..row].reverse
      bottom_half = lines[row + 1..-1]

      fold_size = [top_half.length, bottom_half.length].min
      return row if top_half.first(fold_size) == bottom_half.first(fold_size)
    end
    -1
  end

  def self.rotate_pattern(pattern)
    lines = pattern.strip.split("\n")
    rotated = lines.map(&:chars).reverse.transpose
    rotated.map(&:join).join("\n") + "\n"
  end
end
