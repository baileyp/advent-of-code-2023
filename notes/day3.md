# Day 3

[Solution](../lib/day03.rb) | [Spec](../spec/day03_spec.rb) | [Input](../input/day03.txt)

## Part 1

Already starting to feel comfortable writing ruby unassisted. I can't pretend this is the prettiest code or maybe the
most idiomatic, but that wasn't my goal. Still, I did learn a few new things from the following prompts

> How do I define static class variables?

> Does ruby have a safe navigation operator?

But really the rest of the code is stuff I already knew how to do and/or used previously discussed prompt techniques,
such as writing the unit tests first and then prompting for an implementation, to flesh out the solution.

## Part 2

This wasn't all that hard once I decided on a solution, which a prompt did help me realize was possible:

> In ruby, can I use an array as a hash key?

Based on the response, the rest wasn't bad and I'm happy it worked, given that JavaScript has let me down here
[in the past](https://github.com/baileyp/advent-of-code-2021#day-5-puzzle-solution).

## Epilogue

Ok, so I knew the code I wrote for part 2 looked pretty insane (see commit
[bf2d941](https://github.com/baileyp/advent-of-code-2023/commit/bf2d941)) so I decided to ask CP to help

> Can this code be made simpler?

The result is in commit [b549c8b](https://github.com/baileyp/advent-of-code-2023/commit/b549c8b) and from it I learned:

- You can pass a block of code to `Hash.new` and that functions pretty much idential to Python's `defaultdict`
- Ennumerables have an `each_with_index` method, the yield of which is usable in a `do` loop
- Strings have a `chars` method