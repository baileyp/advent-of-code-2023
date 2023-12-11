# Day 8

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

Incomplete
