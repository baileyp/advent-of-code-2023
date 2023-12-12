# Day 9

## Part 1

Nothing to report. No CP prompting and but some decent help while writing unit tests. Not a hard puzzle for me ⭐

## Part 2

Phooey. I thought I had it on this one. I could visualize the solution pretty well and even saw an opportunity to use a
func partial-application trick, but first:

> Are functions first class in ruby?

Ok, so there's a `lambda` primitive - that should work. So I wrote `curry_subtraction` and used it as a reducer which
worked _a treat_ for the sample input but gives the wrong answer for the real input... sad trombone.

I'll have to come back to this another day.
