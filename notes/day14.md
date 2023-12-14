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

Incomplete
