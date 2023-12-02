# Day 2

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

If you check out the commit []() the first thing to note is that the contents of `game1` and `game3` in the test file -
I did not write those. I startd with the variable name and CP correctly inferred what I was doing, and I was able to
tab-complete both of those structs, all correctly populated with values derived from the `Day02.part1` test 🤯. Pretty
remarkable.

Anyway, I wrote the whole test and then my next prompt:

> Can you write a function that satisifies these tests?

It spit out some code, I blindly copy-pasted it into my `Day02` class and re-ran the tests and wouldn't know they
passed.

Of course there was something in the code I didn't understand which was `to_sym` so another `/explain` prompt later and
now I know that Ruby has a Symbol primitive - neat.