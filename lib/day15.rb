class Day15
  def self.part1(input)
    input.strip.split(",").map{ |step| hash_algo(step) }.sum
  end

  def self.part2(input)
    boxes = Array.new(256) { {} }
    input.strip.split(",").each do |step|
      label, rest = step.split(/[=-]/)
      box_number = hash_algo(label)
      if rest == nil
        boxes[box_number].delete(label)
      else
        boxes[box_number][label] = rest.to_i
      end
    end
    return boxes.each.with_index.reduce(0) do |acc, (lenses, box)|
      box_number = box + 1
      acc + lenses.values.each.with_index.reduce(0) { |sum, (lens, i)| sum + box_number * (lens * (i + 1)) }
    end
  end

  def self.hash_algo(string)
    string.each_char.reduce(0) do |acc, char|
      (acc + char.ord) * 17 % 256
    end
  end
end
