class Day15
  def self.part1(input)
    input.strip.split(",").map{ |step| hash_algo(step) }.sum
  end

  def self.part2(input)
    nil
  end

  def self.hash_algo(string)
    string.each_char.reduce(0) do |acc, char|
      (acc + char.ord) * 17 % 256
    end
  end
end
