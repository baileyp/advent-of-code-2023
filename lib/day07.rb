class Day07
  def self.part1(input)
    hands = parse_input(input).sort do |b, a|
      comp = a[2] <=> b[2]
      comp == 0 ? compare_hands(a[0], b[0]) : comp
    end
    hands.map.with_index{ |hand, index| (index + 1) * hand[1] }.sum
  end

  def self.part2(input)
    hands = parse_input(input)
      # Re-score based on jokers
      .map{ |hand, bid| [hand, bid, score_hand(apply_jokers(hand))] }
      .sort do |b, a|
        comp = a[2] <=> b[2]
        comp == 0 ? compare_hands(a[0], b[0], true) : comp
      end
    hands.map.with_index{ |hand, index| (index + 1) * hand[1] }.sum
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

  def self.apply_jokers(hand)
    counts = hand
      .split('')
      .each_with_object(Hash.new(0)) { |element, counts| counts[element] += 1 }
    num_jokers = counts.fetch('J', 0)
    counts.delete('J')
    best_choice = counts.length == 0 ? 'A' : counts
      .to_a
      .sort{ |a, b| card_oridnal_value(b[0]) <=> card_oridnal_value(a[0]) }
      .sort{ |a, b| b[1] <=> a[1] }
      .first
      .first
    hand.gsub('J', best_choice)
  end

  def self.compare_hands(hand_a, hand_b, with_jokers=false)
    (0..4).each do |i|
      card_a = card_oridnal_value(hand_a[i], with_jokers)
      card_b = card_oridnal_value(hand_b[i], with_jokers)
      if card_a != card_b
        return card_b <=> card_a
      end
    end
    0
  end

  def self.card_oridnal_value(card, j_is_for_joker=false)
    {'T' => 10, 'J' => j_is_for_joker ? 1 : 11, 'Q' => 12, 'K' => 13, 'A' => 14}[card] or card.to_i
  end
end
