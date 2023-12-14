# Day 14

[Solution](../lib/day14.rb) | [Spec](../spec/day14_spec.rb) | [Input](../input/day14.txt)

## Part 1

I can feel it in my bones. Part 2 of this puzzle is going to punish me for a literal/analog implementation. Still, I
could be wrong and I'm not going to bother second-guessing what optimizations part 2 might need in order to apply them
to part 1, so here we go.

In conceptualizing the solution, it seems to me that it would be easier to treat every column as a row so I immediately
saw a re-use opportunity for `Day13.rotate_pattern` so I just imported it.

Then I got about to writing `tilt_line` it seemed to me like this was just a "distributed" sorting problem. Either I'm
lucky or it was by design in the puzzle construction that square rock, empty space, and round rock characters are
already lexically ordered per "tilting" them on direction. Really pleased with the simplicity of this. Yeah, I know it
does a lot of string-to-array conversion and back but it's also tidy so I don't care a ton :) ⭐

## Part 2

Actually, you know what, not so bad. At first when I read _one billion_ cycles I was like "crap" but almost immediately
it seemed clear to me that eventually the rocks moving around would be periodic[^periodic], given the finite space and
quantity.

With that assumption baked in my brain, I got started. I did prompt CP for a little help with one of my functions:

> What's an idiomatic ruby way to repeat a block of code N times?

And that's how I learned about `Integer.times` which I _can't tell you_ how much I wish other languages had.

The rest was honestly not that hard. Maybe from previous puzzle years or something but I knew exactly how to solve this
(given the periodic assumption) and I was right ⭐

[^periodic]:
    As it turns out, the period is quite short (14 with my input) and was found in less than 200 iterations.