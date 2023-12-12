class Day09
  def self.part1(input)
    histories = input
      .each_line
      .map { |line| line.split.map(&:to_i) }
      .map { |history| generate_all_differences(history) }
      .map { |differences| differences.map { |difference| difference.last }.sum }
      .sum
  end

  def self.part2(input)
    histories = input
      .each_line
      .map { |line| line.split.map(&:to_i) }
      .map { |history| generate_all_differences(history) }
      .map { |differences| differences.map { |difference| difference.first } }
      .map { |firsts| firsts.reverse.reduce { |acc, n| n - acc} }
      .sum
  end

  def self.generate_all_differences(history)
    difference = history.dup
    differences = [difference]
    while !difference.all? { |n| n == 0 } do
      difference = build_next_sequence(difference)
      differences << difference
    end
    differences
  end

  def self.build_next_sequence(sequence)
    next_sequence = []
    (1..sequence.length - 1).each do |i|
      next_sequence << sequence[i] - sequence[i - 1]
    end
    next_sequence
  end
end
