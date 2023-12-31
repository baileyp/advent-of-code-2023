# Day 24

[Puzzle ↗️](https://adventofcode.com/2023/day/24) |
[Solution](../lib/day24.rb) |
[Spec](../spec/day24_spec.rb) |
[Input](../input/day24.txt)

## Part 1

I did know from the get-go that this was going to be some vector/matrix math and that I didn't 100% know how to do it on
my own. I think if you _didn't_ have this insight from the jump then a literal mapping of the problem would be quite
impossible given the boundary of the test area.

Anyway, I did have this insight so enter CP:

> Does ruby have classes or functions that help with matrix math?

Brilliant, there is a `Matrix` primitive. Now, with the next bit of code highlighted

```ruby
m1 = Matrix[[19, 13], [-2, 1]]
m2 = Matrix[[18, 19], [-1, -1]]
```

> If these two matrices represent vectors where the 0 index is the x,y position and the 1 index is the direction of the
vector represented as x,y offset or "slope" how can I calculcate where they intersect?

It generated some code that was close, yet wrong, but after a couple re-prompts while citing test-cases, I got the
version of `intersection_point_2d` that you see the solution. Pretty neat although it is clear to me that the Matrix
primitive is not actually doing any work here, since this function completely deconstructs them. Still, I'm leaving it
in since removing it would be a pointless refactor at this point.

CP was also remarkably good at following my lead when writing `intersect_in_future` since it wrote most of that code too.

Then it was just pure top-down map/reduce type problem ⭐

## Part 2

Incomplete
