# Day 5

[Puzzle ↗️](https://adventofcode.com/2023/day/5) |
[Solution](../lib/day05.rb) |
[Spec](../spec/day05_spec.rb) |
[Input](../input/day05.txt)

## Part 1

Really starting to find my sea legs with Ruby. Between conceptualzing the solution, writing specs, and then writing code
to satisfy the spec, I'm already doing most of this with only occasional tab-completes from CP. Even things I didn't
know would work _for sure_ turned out to work just fine, I think largely from my experience but also because Ruby has
some decently intuitive APIs so things like `array.shift` just worked. In fact, I did well over 90% of part 1 while I
was offline on an airplane.

However, I did have one little bug in my algorithm that CP did help me find. Given this test:

```ruby
describe ".to_location_number" do
    it "foo" do
      map = {:soil=>[{:from=>98, :to=>99, :offset=>-48}, {:from=>50, :to=>97, :offset=>2}], :fertilizer=>[{:from=>15, :to=>51, :offset=>-15}, {:from=>52, :to=>53, :offset=>-15}, {:from=>0, :to=>14, :offset=>39}], :water=>[{:from=>53, :to=>60, :offset=>-4}, {:from=>11, :to=>52, :offset=>-11}, {:from=>0, :to=>6, :offset=>42}, {:from=>7, :to=>10, :offset=>50}], :light=>[{:from=>18, :to=>24, :offset=>70}, {:from=>25, :to=>94, :offset=>-7}], :temperature=>[{:from=>77, :to=>99, :offset=>-32}, {:from=>45, :to=>63, :offset=>36}, {:from=>64, :to=>76, :offset=>4}], :humidity=>[{:from=>69, :to=>69, :offset=>-69}, {:from=>0, :to=>68, :offset=>1}], :location=>[{:from=>56, :to=>92, :offset=>4}, {:from=>93, :to=>96, :offset=>-37}]}
      expect(Day05.to_location_number(79, map)).to eq(82)
      expect(Day05.to_location_number(14, map)).to eq(43)
      expect(Day05.to_location_number(55, map)).to eq(86)
      expect(Day05.to_location_number(13, map)).to eq(35)
    end
  end
```

One of the expectations was failing so I asked CP for help:

> For the highlighted test, it is failing on the 2nd expectation. Below is the function it is testing. Can you find the bug?

I pasted the both of `to_location_number` and CP did figure out what was wrong:

> The issue with the current implementation is that it continues to apply offsets from the same map even after an offset
> has been applied. According to the problem statement, once an offset is applied from a map, it should move on to the
> next map.

Basically, the `break` after adjusting `num` was missing. Thanks CP ⭐

## Part 2

Was dreading this eventuality and I had a hunch with how this puzzle was constructed that part 2 would come along and
deliver some abuse, which it did. Based on the real puzzle input, there are a bit over 2.2 billion iterations to this
puzzle - a `O(n)` solution clearly won't do. Might need to bust out some maths. Right now I don't see the way forward so
I'm gonna pass on this one until I've had more time to think.

**2024-01-02 Update**

Interestingly enough, working on [Day 19](./day19.md) gave me an idea to try here. Although as of the time I write this
my part 2 solution for Day 19 doesn't work, it is based on the same strategy that I _successfully_ applied here, which
is to treat ranges as aggregates. Armed with a little existing datatype knowledge I quickly knocked-up intersection,
difference, and symmetric difference functions for ranges (which CP helped me write) and then I just needed to
iteratively apply translations and then return the smallest value ⭐

Maybe I can take a nugget or two with what worked here and fix whatever is wrong with Day 19!
