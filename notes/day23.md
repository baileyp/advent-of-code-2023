# Day 23

[Puzzle ↗️](https://adventofcode.com/2023/day/23) |
[Solution](../lib/day23.rb) |
[Spec](../spec/day23_spec.rb) |
[Input](../input/day23.txt)

## Part 1

I'm actually terrible a knowing if depth-first or breadth-first is better for a problem like this, but I wanted to
experiment using a lambda as an inner function to close variables like `grid` and `visited` and also because I have a
personal distaste for too much message passing.

Very little help from CP today but overall but it did write `cardinal_neighbors` for me and gave great tab-completes for
the `case..when` ⭐

## Part 2

Haha, ok so this didn't _seem_ difficult but when I made the necessary changes and got a ✅ from my integration test on
the sample data, running it promptly _immediately_ yielded a `stack level too deep` error. Ok, so maybe _now_ I know
when to choose BFS?

So I made a BFS version which looked like this:

```ruby
def self.part2(input)
  grid = input.split("\n").map { |line| line.split("") }
  longest_path = 0
  target = [grid.length - 1, grid[0].length - 2]

  queue = Queue.new()
  queue << [0, 1, Set.new()]

  while !queue.empty?
    row, col, visited = queue.pop
    cardinal_neighbors(row, col)
      .filter { |row, col| row >= 0 && col >= 0 }
      .filter { |row, col| row < grid.length && col < grid[0].length }
      .each do |row, col|
        next if grid[row][col] == "#"
        next if visited.include?([row, col])

        if [row, col] == target
          longest_path = [longest_path, visited.length].max
          next
        end
        queue << [row, col, Set.new(visited) << [row, col]]
      end
  end

  longest_path + 1
end
```

I let that run for 2 hours and saw it consumed over 2GB of ram at times before I halted it. Clearly not going to work.

Back on [Day 16](./day16.md) I mentioned that _that_ problem could have been modeled as a graph but I didn't do it that
time. Well, I decided to resurrect that idea here. I'm not ashamed to admit this took a bit longer than I wanted to code
up but the result of `make_graph` produces a full adjacency list where each edge also stores the distance between nodes.

Then it was just a "simple" exercise of again using DFS to walk the graph and find the longest path. The processing time
for this was actually quite a bit longer that I thought it would be - about 95 seconds on this Apple M2 Pro.

Either way, it worked and I'm not optimizing for runtime this year. Plus, it feels good to finally get a 2nd ⭐ after a
few days of being unable to.