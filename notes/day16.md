# Day 16

[Solution](../lib/day16.rb) | [Spec](../spec/day16_spec.rb) | [Input](../input/day16.txt)

## Part 1

Neat puzzle. It did occur to me that this could be modeled as a graph, where each mirror/splitter is a node and each
possible light beam is an edge with a length, but I decided to just do a more literal implementation and simulate beams
bouncing around the contraption.

I didn't have to do any CP prompting but it was _very_ helpful in givng me tab-completes for most of the blocks of code.
In fact, that's why - other than the input parsing - there's nothing functional here, just one big procedural algorithm.
Measuring by lines-of-code, CP is the bigger contributor between the two of us. Anyway, I might need to refactor or do
some extract method for part two but that's OK.

The only snag I hit was not realizing the "graph" was cyclical so once I solved for that I got myself a ⭐

## Part 2

Wow, ok, so this has to be up there for the fastest part 2 solve I've had ever had. So I did end up doing an extract
method refactor where I just basically put _all_ of part 1 ([original commit](https://github.com/baileyp/advent-of-code-2023/commit/413f100))
into the new method `energize_contraption`.

Then it was a simple brute-force loop and why this solution was so fast is due to a huge assist from CP. I'll show you
exatly how much code I typed vs what was tab-completes from CP.

```ruby
# Started with

wid #tab
width, height, contraption = parse_input(input)

# Then
most_energized = 0

# Then
for ro #tab
for row in 0...height

  # Then
  most_energized = [#tab
  most_energized = [most_energized, energize_contraption(width, height, contraption, [row, -1, :right])].max

  # Then
  most_energized = [
    most_energized,
    energize_contraption(width, height, contraption, [row, -1, :right]),
    #tab
  most_energized = [
    most_energized,
    energize_contraption(width, height, contraption, [row, -1, :right]),
    energize_contraption(width, height, contraption, [row, width, :left])
  ].max

# Then
end

# Then
for co #tab
for col in 0...width
  most_energized = [
    most_energized,
    energize_contraption(width, height, contraption, [-1, col, :down]),
    energize_contraption(width, height, contraption, [height, col, :up])
  ].max
end

# Then
return mo #tab
return most_energized
```

If you do the math, I only typed a few dozen characters. WHERE HAVE YOU BEEN MY WHOLE LIFE, CP? ⭐
