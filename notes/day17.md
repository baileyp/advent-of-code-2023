# Day 17

[Puzzle ↗️](https://adventofcode.com/2023/day/17) |
[Solution](../lib/day17.rb) |
[Spec](../spec/day17_spec.rb) |
[Input](../input/day17.txt)

## Part 1

I've come back to this because back when I first looked at this, I just didn't have the time to give it a proper think
so I just skipped it.

So this is clearly a pathfinding problem and I wanted to give Djikstra a shot but Ruby's Queue isn't sortable and when
I asked CP:

> Does ruby have priority queues?

The response was "implement it yourself or install this gem" and I really didn't want to install a gem so let's see how
good CP is at helping me write one myself.

I started by just typing `class PriorityQueue` and waiting for CP to give a suggestion but what came back was just a
wrapper around an Array and I wanted something heap-based so re-did as `class PriorityQueueAsBinaryHeap` gave me this

```ruby
class PriorityQueueAsBinaryHeap
  def initialize
    @elements = [nil]
  end

  def <<(element)
    @elements << element
    bubble_up(@elements.length - 1)
  end

  def pop
    exchange(1, @elements.length - 1)
    max = @elements.pop
    bubble_down(1)
    max
  end

  def empty?
    @elements.length == 1
  end

  private

  def bubble_up(index)
    parent_index = (index / 2)
    return if index <= 1
    return if @elements[parent_index] >= @elements[index]
    exchange(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = (index * 2)
    return if child_index > @elements.length - 1
    not_the_last_element = child_index < @elements.length - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]
    child_index += 1 if not_the_last_element && right_element > left_element
    return if @elements[index] >= @elements[child_index]
    exchange(index, child_index)
    bubble_down(child_index)
  end

  def exchange(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end
end
```

Ok, neat! Does it work? Wait... how do I set the priority?

> I can't figure out where the priority value is derived from per element added, can you help me?

Then it explained how the priority was determined in a value-of kind of way but gave me suggestions for how I could
modify the class to provide a priority while setting elements.

Rather than going that way I did a quick test of ruby's default treatment of array comparisons with `<=>` and found that
it is always the 0th element of the array that determines the result, so I just modified the provided PriorityQueue code
to behave based on that, oh and to treat low values as priority over high values.

Once I had that it worked! ⭐

For the sake of comparison I _did_ quickly make a version using an array for the queue and that took 123.87 seconds.
Compared to the 5.37 seconds of the PriorityQueue version, that's quick the difference! I assume the bulk of that
additional time is from having to sort the array-based queue after every iteration.

## Part 2

Incomplete
