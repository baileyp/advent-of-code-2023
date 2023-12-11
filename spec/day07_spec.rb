require_relative '../lib/day07'

describe Day07 do
  input = <<~INPUT
    32T3K 765
    T55J5 684
    KK677 28
    KTJJT 220
    QQQJA 483
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day07.part1(input)).to eq(6440)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day07.part2(input)).to eq(5905)
    end
  end

  describe ".score_hand" do
    it "five of a kind to score 0" do
      expect(Day07.score_hand('11111')).to eq(0)
    end

    it "four of a kind to score 1" do
      expect(Day07.score_hand('12111')).to eq(1)
      expect(Day07.score_hand('11121')).to eq(1)
    end

    it "full house to score 2" do
      expect(Day07.score_hand('12121')).to eq(2)
      expect(Day07.score_hand('AKAKA')).to eq(2)
    end

    it "three of a kind to score 3" do
      expect(Day07.score_hand('T55J5')).to eq(3)
      expect(Day07.score_hand('QQQJA')).to eq(3)
    end

    it "two pair to score 4" do
      expect(Day07.score_hand('KK677')).to eq(4)
      expect(Day07.score_hand('KTJJT')).to eq(4)
      expect(Day07.score_hand('12321')).to eq(4)
    end

    it "one pair to score 5" do
      expect(Day07.score_hand('32T3K')).to eq(5)
      expect(Day07.score_hand('AA123')).to eq(5)
      expect(Day07.score_hand('12AA3')).to eq(5)
    end

    it "high card to score 6" do
      expect(Day07.score_hand('32T4K')).to eq(6)
      expect(Day07.score_hand('AK123')).to eq(6)
      expect(Day07.score_hand('12TA3')).to eq(6)
    end
  end

  describe ".compare_hands" do
    it "correctly determing stronger hands for sorting" do
      expect(Day07.compare_hands('AAAAA', 'AAAAA')).to eq(0)
      expect(Day07.compare_hands('AAAAA', 'AAKAA')).to eq(-1)
      expect(Day07.compare_hands('AKAAA', 'AAAAA')).to eq(1)
      expect(Day07.compare_hands('T55J5', 'QQQJA')).to eq(1)
      expect(Day07.compare_hands('KK677', '32T3K')).to eq(-1)
    end
  end

  describe ".card_oridnal_value" do
    it "convert card names to a numeric ordinal value" do
      expect(Day07.card_oridnal_value('A')).to eq(14)
      expect(Day07.card_oridnal_value('J')).to eq(11)
      expect(Day07.card_oridnal_value('3')).to eq(3)
    end

    it "works with jokers, too" do
      expect(Day07.card_oridnal_value('J', true)).to eq(1)
    end
  end

  describe ".apply_jokers" do
    it "replaces jokers with the best card option" do
      expect(Day07.apply_jokers('QJJQ2')).to eq('QQQQ2')
      expect(Day07.apply_jokers('4321J')).to eq('43214')
      expect(Day07.apply_jokers('4311J')).to eq('43111')
    end

    it "even works with all jokers" do
      expect(Day07.apply_jokers('JJJJJ')).to eq('AAAAA')
    end
  end
end
