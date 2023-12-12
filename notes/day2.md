# Day 2

[Solution](../lib/day02.rb) | [Spec](../spec/day02_spec.rb) | [Input](../input/day02.txt)

## Part 1

Only after just one day I already felt good about getting started with just writing code instead of beginning with any
prompts. First task was to write a function that would parse each line into an object I could work with to solve
the puzzle.

So that's what I did, starting with `def self.parse_input(input)` and writing what I _thought_ was correct and letting
CP guide me along the way. I got the entire function written before I realized a problem and it was with destructuring,
which I just started with the assumption that Ruby supported.

Without thinking about it too much I had used a JavaScript style and wrote `[game, rest] = input.split(': ')` which is
not correct, and VSCode gave no warning that I did something wrong. Only after running it did I see that it broke, enter
my first prompt of the day:

> Can I destructure non-scalar data into variables in ruby?

Oh, I see, it's more Python than JavaScript: `game, rest = input.split(': ')`. After making this modification I prompted
for `/tests` and that got my test coverage in place, visible in commit [a89a93c](https://github.com/baileyp/advent-of-code-2023/commit/a89a93c)

For the next funciton I planned to write, something that would determine if a given game was possible for a given set of
bag contents, I thought I'd try writing the test first and see if CP could make a function from the spec.

If you check out the commit [2906d6e](https://github.com/baileyp/advent-of-code-2023/commit/2906d6e) the first thing to
note is that the contents of `game1` and `game3` in the test file - I did not write those. I started with the variable
name and CP correctly inferred what I was doing, and I was able to tab-complete both of those hashes, all correctly
populated with values derived from the `Day02.part1` test 🤯. Pretty remarkable.

Anyway, I wrote the whole test and then my next prompt:

> Can you write a function that satisifies these tests?

It spit out some code, I blindly copy-pasted it into my `Day02` class and re-ran the tests and wouldn't you know, they
passed.

Of course there was something in the code I didn't understand which was `to_sym` so another `/explain` prompt later and
now I know that Ruby has a Symbol primitive - neat.

The rest was trivial. From what I've already learned about ruby I knew I could use `filter_map` and then `sum` to get
the desired result ⭐.

## Intermission

One thing that I had to do here, that I forgot about, was to require the `Day02` module in `bin/run.rb`. It's fine but
something I'd prefer to avoid so I highlighted that code and prompted CP:

> I've already included two modules here that have a numeric sequence. Over time, I will include all the way up to
> `day25`. Is there a way to require these dynamically so that I don't have to add a `require_relative` line for all 25
> modules?

[Grand](https://github.com/baileyp/advent-of-code-2023/commit/aaece6d). And now I learned two new things about Ruby:

- You can quickly construct ranges with `from..to`
- Exception management (or something that looks like it) is not `try..catch` but rather `begin..resuce` - interesting

## Part 2

Oh, so this is interesting. I considered in day one making my game hashes look liks this:

```ruby
{
  game_id: 1,
  sets: { "blue" => [3, 6], "red" => [4, 1], "green" => [2, 2] }
}
```

Instead of the more literal mapping that I actually did, which looks like this:

```ruby
{
  game_id: 1,
  sets: [
    { "blue" => 3, "red" => 4 },
    { "red" => 1, "green" => 2, "blue" => 20 },
    { "green" => 2 }
  ]
}
```

The puzzle for part two would make this structure much easier to work with, so the first thing I'm going to do is
attempt to use CP to do a refactor of part 1 based on the new hash structure.

> I'd like to refactor this function so that when given the `input`
>
> Game 11: 3 blue, 4 red; 1 red, 2 green, 20 blue; 2 green
>
> The return value will look like this instead of what it does now
>
> {
>   game_id: 11,
>   sets: { "blue" => [3, 20], "red" => [4, 1], "green" => [2, 2] }
> }

When I accepted the code suggestion and updated the test, it worked! Now I need the rest of the solution updated. I
highlighted `is_game_possible` and prompted:

> Based on the successful refactor to `self.parse_input` this function now needs to be updated based on the new
structure of the `game` hash

This _almost_ worked. Here's the code it gave me:

```ruby
def self.is_game_possible(game, bag)
  game[:sets].each do |color, counts|
    total_needed = counts.sum
    return false if bag[color.to_sym].to_i < total_needed
  end
  true
end
```

The "bug" is on line 3 - I don't need the `sum` of the counts, I need the `max`. Of course I could prompt CP to fix
this but I see the solution myself so I'll fix it. Point is - while so far CP is proving to be quite capable, there are
limits to its "intuition" and is not perfect.

Also, updating the tests was a breeze since, once again, CP let me tab-complete the `expected_output` values with
absolutely no effort. Results of this refactor in commit [131aa35](https://github.com/baileyp/advent-of-code-2023/commit/131aa35).

From here the rest was simple. I wrote `min_colors_needed` with my own brain and prompted for test updates, which not
only made the tests but fixed tests that I got wrong in the previous commit 🤦.

The only challenge remaining was a simple way to reduce an array as a `product` not a `sum`:

> How can I reduce an array of numbers as a product similar to how `[].sum` works

Oh wow, `array.inject` is super neat for simple reductions. Et voila ⭐!
