# Day 7

[Solution](../lib/day07.rb) | [Spec](../spec/day07_spec.rb) | [Input](../input/day07.txt)

## Part 1

At first read I felt like I understood this problem pretty well, so I started my solving with this prompt:

> Does ruby have something similar to python's Counter data type?

To which it spat out:

```ruby
array = ['a', 'b', 'a', 'c', 'b', 'b', 'a']
counter = array.each_with_object(Hash.new(0)) { |element, counts| counts[element] += 1 }
```

Which is close enough, so I ran with that. When I got far enough that I knew I'd want some custom sorting, I asked CP:

> Can I sort an array in ruby with a custom compare function?

Here is the response:

```ruby
array = [1, 2, 3]
sorted_array = array.sort do |a, b|
  # Custom comparison logic goes here
  b <=> a  # This will sort in descending order
end
```

This was enough to get me going - yay spaceship operator. After squashing a couple bugs because I was being lazy and
didn't write enough unit tests (a missing `string.to_i` in my `card_oridnal_value` function bit me for longer than I
care to admit) I had a solution ⭐

## Part 2

Only help I needed from CP here was this:

> Can I delete a key from a hash in ruby?

I suppose I could have assumed `hash.delete` would exist but I didn't and so here we are ⭐. However, at this point I
should say that while I'm committed to my original goals and using CP as my only reference, for questions like these it
is clear that CP is not the most efficient tool.

I did forget to mention in my Part 1 notes that I also needed help with this:

> In ruby how can I return from a function while in the middle of a loop?

I had become so accustomed to not using any sort of explicit `return` in my functions, it didn't even really dawn on me
that it existed as a keyword.
