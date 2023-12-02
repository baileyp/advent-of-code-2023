class Day02
  def self.part1(input)
    bag = { red: 12, green: 13, blue: 14 }
    games = input.each_line.map{ |line| parse_input(line.chomp) }
    games.filter_map { |game| game[:game_id] if is_game_possible(game, bag) }.sum
  end

  def self.part2(input)
    nil
  end

  def self.parse_input(input)
    game, rest = input.split(': ')
    game_id = game.scan(/\d+/).first.to_i
    sets = Hash.new { |h, k| h[k] = [] }
    rest.split('; ').each do |set|
      set.split(', ').each do |play|
        count, color = play.split(' ')
        sets[color] << count.to_i
      end
    end
    return { game_id: game_id, sets: sets }
  end

  def self.is_game_possible(game, bag)
    game[:sets].each do |color, counts|
      total_needed = counts.max
      return false if bag[color.to_sym].to_i < total_needed
    end
    true
  end
end
