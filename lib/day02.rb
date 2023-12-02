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
    sets = rest.split('; ').map do |set|
      plays = set.split(', ').map do |play|
        count, color = play.split(' ')
        [color, count.to_i]
      end
      plays.to_h
    end
    return { game_id: game_id, sets: sets }
  end

  def self.is_game_possible(game, bag)
    game[:sets].each do |set|
      set.each do |color, count|
        return false if bag[color.to_sym].to_i < count
      end
    end
    true
  end
end
