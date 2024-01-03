require_relative '../lib/day05'

describe Day05 do
  input = <<~INPUT
    seeds: 79 14 55 13

    seed-to-soil map:
    50 98 2
    52 50 48

    soil-to-fertilizer map:
    0 15 37
    37 52 2
    39 0 15

    fertilizer-to-water map:
    49 53 8
    0 11 42
    42 0 7
    57 7 4

    water-to-light map:
    88 18 7
    18 25 70

    light-to-temperature map:
    45 77 23
    81 45 19
    68 64 13

    temperature-to-humidity map:
    0 69 1
    1 0 69

    humidity-to-location map:
    60 56 37
    56 93 4
  INPUT

  describe ".part1" do
    it "rreturns the solution to part 1" do
      expect(Day05.part1(input)).to eq(35)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day05.part2(input)).to eq(46)
    end
  end

  describe ".parse_input" do
    it "parses the input into seeds and maps" do
      input1 = <<~INPUT
        seeds: 79 14 55 13

        seed-to-soil map:
        50 98 2
        52 50 48

        soil-to-fertilizer map:
        0 15 37
        37 52 2
        39 0 15
      INPUT
      expected_output1 = {
        seeds: [79, 14, 55, 13],
        maps: {
          soil: [
            {from: 98, to: 99, offset: -48},
            {from: 50, to: 97, offset: 2}
          ],
          fertilizer: [
            {from: 15, to: 51, offset: -15},
            {from: 52, to: 53, offset: -15},
            {from: 0, to: 14, offset: 39}
          ]
        }
      }
      expect(Day05.parse_input(input1)).to eq(expected_output1)
    end
  end

  describe ".to_location_number" do
    it "foo" do
      map = {:soil=>[{:from=>98, :to=>99, :offset=>-48}, {:from=>50, :to=>97, :offset=>2}], :fertilizer=>[{:from=>15, :to=>51, :offset=>-15}, {:from=>52, :to=>53, :offset=>-15}, {:from=>0, :to=>14, :offset=>39}], :water=>[{:from=>53, :to=>60, :offset=>-4}, {:from=>11, :to=>52, :offset=>-11}, {:from=>0, :to=>6, :offset=>42}, {:from=>7, :to=>10, :offset=>50}], :light=>[{:from=>18, :to=>24, :offset=>70}, {:from=>25, :to=>94, :offset=>-7}], :temperature=>[{:from=>77, :to=>99, :offset=>-32}, {:from=>45, :to=>63, :offset=>36}, {:from=>64, :to=>76, :offset=>4}], :humidity=>[{:from=>69, :to=>69, :offset=>-69}, {:from=>0, :to=>68, :offset=>1}], :location=>[{:from=>56, :to=>92, :offset=>4}, {:from=>93, :to=>96, :offset=>-37}]}
      expect(Day05.to_location_number(79, map)).to eq(82)
      expect(Day05.to_location_number(14, map)).to eq(43)
      expect(Day05.to_location_number(55, map)).to eq(86)
      expect(Day05.to_location_number(13, map)).to eq(35)
    end
  end

  describe ".translate_range" do
    it "does a simple translation" do
      before = [[79, 93]]
      after = [[81, 95]]
      map = [{:from=>98, :to=>99, :offset=>-48}, {:from=>50, :to=>97, :offset=>2}]
      expect(Day05.translate_range(before, map)).to eq(after)
    end

    it "does a single overlap translation" do
      before = [[79, 105]]
      after = [[50, 51], [81, 99], [100, 105]]
      map = [{:from=>98, :to=>99, :offset=>-48}, {:from=>50, :to=>97, :offset=>2}]
      expect(Day05.translate_range(before, map)).to eq(after)
    end
  end

  describe ".range_intersection" do
    it "returns the intersection of two ranges" do
      range1 = [1, 5]
      range2 = [3, 7]
      range3 = [6, 8]
      expect(Day05.range_intersection(range1, range2)).to eq([3, 5])
      expect(Day05.range_intersection(range2, range3)).to eq([6, 7])
      expect(Day05.range_intersection(range1, range1)).to eq([1, 5])
      expect(Day05.range_intersection(range1, range3)).to eq(nil)
    end
  end

  describe ".range_symmetric_difference" do
    it "returns the symmetric difference of two ranges" do
      range1 = [1, 5]
      range2 = [3, 7]
      range3 = [6, 8]
      expect(Day05.range_symmetric_difference(range1, range2)).to eq([[1, 2], [6, 7]])
      expect(Day05.range_symmetric_difference(range1, range3)).to eq([[1, 5], [6, 8]])
      expect(Day05.range_symmetric_difference(range2, range3)).to eq([[3, 5], [8, 8]])
    end
  end

  describe ".range_difference" do
    it "returns the difference of two ranges" do
      range1 = [1, 5]
      range2 = [3, 7]
      range3 = [6, 8]
      range4 = [0, 10]
      expect(Day05.range_difference(range1, range2)).to eq([[1, 2]])
      expect(Day05.range_difference(range1, range3)).to eq([[1, 5]])
      expect(Day05.range_difference(range2, range3)).to eq([[3, 5]])
      expect(Day05.range_difference(range3, range2)).to eq([[8, 8]])
      expect(Day05.range_difference(range4, range2)).to eq([[0, 2], [8, 10]])
    end
  end
end