require_relative '../lib/day23'

describe Day23 do
  input = <<~INPUT
    #.#####################
    #.......#########...###
    #######.#########.#.###
    ###.....#.>.>.###.#.###
    ###v#####.#v#.###.#.###
    ###.>...#.#.#.....#...#
    ###v###.#.#.#########.#
    ###...#.#.#.......#...#
    #####.#.#.#######.#.###
    #.....#.#.#.......#...#
    #.#####.#.#.#########v#
    #.#...#...#...###...>.#
    #.#.#v#######v###.###v#
    #...#.>.#...>.>.#.###.#
    #####v#.#.###v#.#.###.#
    #.....#...#...#.#.#...#
    #.#########.###.#.#.###
    #...###...#...#...#.###
    ###.###.#.###v#####v###
    #...#...#.#.>.>.#.>.###
    #.###.###.#.###.#.#v###
    #.....###...###...#...#
    #####################.#
  INPUT

  wee_input = <<~INPUT
    #.######
    #..#####
    ##.#####
    #.>....#
    #.##v#.#
    #....#.#
    ######.#
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day23.part1(input)).to eq(94)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day23.part2(input)).to eq(154)
    end
  end

  describe ".make_graph" do
    it "converts the input into a graph" do
      graph = {
        [0, 0] => Set[[3, 2, 5]],
        [3, 2] => Set[[0, 0, 5], [3, 4, 8], [3, 4, 2]],
        [3, 4] => Set[[3, 2, 8], [3, 2, 2], [6, 6, 5]],
      }
      grid = wee_input.split("\n").map { |line| line.split("") }
      expect(Day23.make_graph(grid)).to eq(graph)
    end
  end
end
