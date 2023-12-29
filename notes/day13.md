# Day 13

[Puzzle ↗️](https://adventofcode.com/2023/day/13) |
[Solution](../lib/day13.rb) |
[Spec](../spec/day13_spec.rb) |
[Input](../input/day13.txt)

## Part 1

Continuing to get good mileage out of CP as a true coding assistant. I didn't exactly know the ruby features I needed to
write `rotate_pattern` but I knew it was possible, and so did the AI - just by merely typing `def self.rotate_pattern`
it gave me a solution that works, and now I know about `Array.transpose` which is super handy and likely to be useful in
other AoC puzzles to come. The rest was all me although I did have to pummel my implementation with a bunch of tests to
grapple with edge cases. I did hit a snag when using the range accessor syntax of `[N..M]` and misunderstood that the
range is _inclusive_ i.e., `[0..0]` returns the 0th element, not no elements. Once fixed ⭐

I was curious, though, about how idiomatic I'm being with my code so I highlighted this function

```ruby
def self.find_fold(lines)
  (0..lines.length - 2).each do |row|
    top_half = lines[0..row].reverse
    bottom_half = lines[row + 1..-1]

    fold_size = [top_half.length, bottom_half.length].min
    if top_half[0...fold_size] == bottom_half[0...fold_size]
      return row
    end
  end
  -1
end
```

And asked CP:

> Is there a more idiomatic way to write this function in ruby?

Here is what it gave me

```ruby
def self.find_fold(lines)
  lines.each_index do |row|
    top_half = lines[0..row].reverse
    bottom_half = lines[row + 1..-1]

    fold_size = [top_half.length, bottom_half.length].min
    return row if top_half.first(fold_size) == bottom_half.first(fold_size)
  end
  -1
end
```

Things I learned from this:

- The `first` method actually has an `n` argument that defaults to `1` but can be any positive integer[^first].
- `return` can be combined with `if` for slightly tidier statements
- CP doesn't always catch every nuance. In the orignal code the loop was designed to stop iterating at N-1 and the
  suggested code _definitely_ breaks.

When I re-prompted about the bug:

> This doesn't work since the original code stops looping at before the end of the available array indicies. Can your
> more idiomatic example accommodate this?

I got this response:

```ruby
def self.find_fold(lines)
  (0...lines.length - 1).each do |row|
    top_half = lines[0..row].reverse
    bottom_half = lines[row + 1..-1]

    fold_size = [top_half.length, bottom_half.length].min
    return row if top_half.first(fold_size) == bottom_half.first(fold_size)
  end
  -1
end
```

I had already caught the range selector `...` from other CP code which I think is a great little bit of syntactic sugar
from ruby. At any rate, this is the version I committed and I will try to keep these idioms in mind as I do more puzzles.

## Part 2

Incomplete

[^first]:
    I did test this and a negative `n` raises an `ArgumentError`