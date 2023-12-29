# Day 19

[Puzzle ↗️](https://adventofcode.com/2023/day/19) |
[Solution](../lib/day19.rb) |
[Spec](../spec/day19_spec.rb) |
[Input](../input/day19.txt)

## Part 1

I enjoy the functional aspect of solutions like this one. Ruby has just enough first-class treatment of functions with
lambdas that makes this possible. I really didn't seek any help from CP here other than to write `parse_workflow` from
the spec - after I did some thinking and decided what I wanted each workflow to look like in a parsed format. I'm
particularly pleased with being able to `inject` the operation that achieves some `eval`-like qualities without actually
being `eval` since... you know... _eval is **evil**_. ⭐

## Part 2

Phooey. I really thought I had this one. Solution works on the sample input but not the real input. I thought maybe it
was happening because of some range overlaps (`from` being greater than `to`) but when I put in guard checks for that it
didn't change the output.

I'll have to come back to this later.
