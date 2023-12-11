# Day 7

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

This was enough to get me going. After squashing a couple bugs because I was being lazy and didn't write enough unit
tests (a missing `string.to_i` in my `card_oridnal_value` function bit me for longer than I care to admit) I had a
solution ⭐

## Part 2

Incomplete
