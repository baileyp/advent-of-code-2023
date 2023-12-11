class Day07
  def self.part1(input)
    hands = parse_input(input).sort do |b, a|
      comp = a[2] <=> b[2]
      comp == 0 ? compare_hands(a[0], b[0]) : comp
    end
    hands.map.with_index{ |hand, index| (index + 1) * hand[1] }.sum
  end

  def self.part2(input)
    nil
  end

  def self.parse_input(input)
    input.each_line
      .map{ |line| line.split(" ") }
      .map{ |hand, bid| [hand, bid.to_i, score_hand(hand)] }
  end

  def self.score_hand(hand)
    counts = hand.split('').each_with_object(Hash.new(0)) { |element, counts| counts[element] += 1 }.values.sort.reverse
    {
      [5] => 0,
      [4, 1] => 1,
      [3, 2] => 2,
      [3, 1, 1] => 3,
      [2, 2, 1] => 4,
      [2, 1, 1, 1] => 5,
      [1, 1, 1, 1, 1] => 6
    }[counts]
  end

  def self.compare_hands(hand_a, hand_b)
    (0..4).each do |i|
      card_a = card_oridnal_value(hand_a[i])
      card_b = card_oridnal_value(hand_b[i])
      if card_a != card_b
        return card_b <=> card_a
      end
    end
    0
  end

  def self.card_oridnal_value(card)
    {'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14}[card] or card.to_i
  end
end
