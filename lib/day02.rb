class Day02
  def self.part1(input)
    games = input.each_line.map{ |line| parse_input(line.chomp) }
    nil
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
end
