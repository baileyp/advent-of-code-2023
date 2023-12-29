# Day 8

[Puzzle ↗️](https://adventofcode.com/2023/day/8) |
[Solution](../lib/day08.rb) |
[Spec](../spec/day08_spec.rb) |
[Input](../input/day08.txt)

## Part 1

Graphs and queues! Not a hard puzzle, it turns out, but I did have to ask CP some basics about queues:

> Does ruby have any queue or queue-like datatypes?

From there the solution took just a couple minutes, so I decided to go a little further and split up my input parser to look like this

```ruby
def self.parse_input(input)
  instructions, graph = input.split("\n\n")
  [parse_instructions(instructions), parse_graph(graph)]
end
```

And then see if CP could make a unit test that properly mocks `parse_instructions` and `parse_graph`. A direct CP promp
to `/tests` didn't do this so I went into the chat interface:

> Can you write a unit test for this function and mock the calls to `parse_instructions` and `parse_graph`?

The response have me `Minitest` code so I re-prompted for `RSpec` and got the result I wanted. While it was _a little_
disappointing that I had to specifically prompt for the mocks (otherwise it's not a unit test, right?) but also happy
that CP churned out this code because as an engineer it was always these mocked tests that were the least fun to write,
so being able to offload that to an AI assistant is fab. ⭐

## Part 2

Wheeee! I didn't realize at first how many more iterations would be required for the more literal solution to run until
I solved it - turns out to be almost _18 trillion_!.

Still, I did realize that the graph was cyclical and would likely be periodic so from that point is was just finding the
period for each "A" starting point and then calculating the least-common-multiple for the results. I did hit a bit of a
stumbling block with CP though:

> In ruby, are queues passed as references and, if so, can I forcibly pass one as a copy?

This told me that yes, all objects are passed by reference and that I could use `queue.dup` to make a copy. Literally
this code:

```ruby
queue = Queue.new
queue << 'element1'
queue << 'element2'

copy_of_queue = queue.dup
```

When I ran it I got a `NoMethodError` so I asked CP what was up:

> This code is giving me a NoMethodError message of "undefined method `initialize_copy'" can you help?

Part of the response literally says this:

> In Ruby, some objects, like instances of the `Queue` class, can't be duplicated or cloned.

So yeah, hallucination. Anyway, once I figured out how to clone a queue (I ended up just re-creating) CP very nicely
helped me learn that `lcm` is a thing in Ruby. Thanks! ⭐