# Day 18

[Solution](../lib/day18.rb) | [Spec](../spec/day18_spec.rb) | [Input](../input/day18.txt)

## Part 1

Pretty simple puzzle. CP of course did it's thing with lots of tab-completes but otherwise this was a straight-forward
DFS or BFS problem, the latter of which I chose here.

Of course, the solution doesn't even require the `color` values from the input so those will inevitably feature in
part 2 some way.

⭐

## Part 2

So when I passed this up originally I knew two things:

1. It was a math problem
2. I didn't already know the formula

So with a slight accession to this year's goals, for the first time I asked CP something that was closer to a general
knowledge inquiry rather than a specific programming thing:

> How can I find the area of a concave polygon?

It spat out the `area_of_polygon` function just as you see it in my code. Of course, I had to do a little extra math to
account for the area of the trench but that wasn't _too_ hard but it took a little whack-a-mole guessing but I got it
in the end! ⭐
