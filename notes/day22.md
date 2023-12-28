# Day 22

[Solution](../lib/day22.rb) | [Spec](../spec/day22_spec.rb) | [Input](../input/day22.txt)

## Part 1

Throwing in the towel for now. Not sure what's wrong but my solution so far is pretty tidy and a pretty literal mapping
of the problem space. Passes on the test data but I get a "answer too high" from the actual input.

Still, I will pause a moment to make a note about how important unit tests are for things like this. Almost every time
I omit them - especially if I mentally believe the problem to be trivial - I am reminded of their usefulness and aid in
abolishing assumptions. As you can see, I ended up writing _a lot_ of tests for `Day22.supported?`.

Speaking of `supported?` I'll also note that today was the first time I remembered to get on board with what I've now
learned is a bit of a de-facto naming convention for Ruby functions - testers that return booleans are suffixed with `?`
and mutators are suffixed with `!`.

Still, the solution overall doesn't work and I'll have to live with that for the time being and am committing a broken
solver.

## Part 2

Incomplete
