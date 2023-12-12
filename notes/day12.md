# Day 12

[Solution](../lib/day12.rb) | [Spec](../spec/day12_spec.rb) | [Input](../input/day12.txt)

## Part 1

I took a little help from CP today when making the `make_permutations` function. I knew from previous years that
`product` operations on collections are permutation generators. Once I had that, it was just logic although I can admit
that this solution is _very_ non-optimal - takes some 33 seconds to run - and I'm already predicting that it will be
insufficient for part 2. Either way ⭐

## Part 2

Yeah, nope. I wrote a slightly less greedy version of my solution for part 1 which did make it about 3x faster (which
I'll commit with this note) but it's nowhere near fast enough for the real input - not even the integration test version
runs in a reasonable amount of time.
