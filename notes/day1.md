# Day 1

## Preamble

There's a basic bit I didn't solve with my initial bootstrap, perhaps best explained by my prompt:

> When opening file contents via `File.read` as done in `MyCli.run` what is a sensible way to loop over that input
line-by-line?

Which gave me:

```ruby
input.each_line do |line|
  line = line.chomp
  # process each line here
end
```

Perfect!

Also, I figured I'd try TDD so I did this next:

> I'd like to do some TDD here and for `Day01.part` when the given input is the following
>
> 1abc2
> pqr3stu8vwx
> a1b2c3d4e5f
> treb7uchet
>
> Then the expected return is `142`

The result is in commit [37bfb1a](https://github.com/baileyp/advent-of-code-2023/commit/37bfb1a).

In the same response, it also suggested some naive code which clearly won't work, but teaches me a bit about how ruby
works:

```ruby
input.scan(/\d+/).map(&:to_i).sum
```

## Part 1

Ok, now it's time to actually write puzzle code. I need to parse out the 1st and nth digits from each line of input like
so:

```
1abc2         -> 12
pqr3stu8vwx   -> 38
a1b2c3d4e5f   -> 15
treb7uchet    -> 77
```

My first prompt was:

> Given a string such as `ab3cd` I need to find the first and the nth integer and combine them into a single integer,
> which in this case would be `33`. If the string was `a3b7c5d` then the resulting integer would be `35`

The recommended function looks like this:

```ruby
def combine_integers(str, n)
  numbers = str.scan(/\d+/).map(&:to_i)
  return nil if numbers.size < n
  "#{numbers[0]}#{numbers[n - 1]}".to_i
end
```

This is not exactly what I want, but I see how to modify it to be so. Also, there *is* a subtle bug in here but I'm
going to let it ride for now to see how the unit test deals with it.

So this teaches me quite a few things about ruby:

- Collections are mappable (btw, is this a list, or an array, or?)
- Strings can be scanned (matched on) with a regex
- Ruby uses `nil` as a bottom value
- Template strings are done with double quotes and `#{}` for variable interpolation
- Combined with previous inputs, there seem to be lots of short, type-conversion helpers where `to_i` makes integers
- There's a JavaScripty feel in that most things are objects with methods

So one of the coolest features of CP is that you can select code and run `/explain` which I did on this snippet and
further learned:

- `str.map` returns arrays
- `&` seems to be a static reference to the mapped element

So it seems now to me that since the puzzle requires I aggregate all the lines into a single number, and mapping is a
thing, I don't need a `do` loop I just need map/reduce the data. But how do I call my own function in a map callback?

> How would I call `combine_integers` inside of a `.map()` invocation?

Here's the example it gave

```ruby
strings = ['ab3cd', 'a3b7c5d']
n = 2
results = strings.map { |str| combine_integers(str, n) }
```

Huh?

> Why is `strings.map` invoked here with curly braces instead of parentheses?
> ...
> In Ruby, curly braces `{}` and `do..end` are used to define blocks of code. Blocks are anonymous pieces of code that
> can accept input and are used throughout Ruby, particularly with methods like map, each, select, etc.

Oh, ok!

Armed with this knowledge, I wrote my first bit of ruby all by myself.

```ruby
class Day01
  def self.part1(input)
    input.each_line.map{ |line| combine_integers(line.chomp)}.sum
  end
end

def combine_integers(str)
  numbers = str.scan(/\d+/).map(&:to_i)
  "#{numbers[0]}#{numbers[numbers.size - 1]}".to_i
end
```

The tests pass too, which is cool but also means that the sample data doesn't trigger the bug I see. Adding this test

```ruby
it "only selects single digits at a time" do
  input = <<~INPUT
    ab12cd
    wx45yz
  INPUT

  expect(Day01.part1(input)).to eq(57)
end
```

Validates it when I remove the `+` from the regex. Now here's the interesting part - *I* am the source of this bug. I
prompted CP as "I need to find the first and the nth **integer**" and because I wrote **integer** instead of **digit**, CP did the right thing. I verified this by re-prompting but using **digit** instead and it gave the correct result.

Garbage in, garbage out.

Anyway, ran it properly and the solution was correct! ⭐

Now, is this the *best* solution? Not likely. I could have prompted it for guidance on how to walk the string from the
left and right sides and that would be cool to see, but I also wanted to know how sophisticated the results would be.
Perhaps later I'll do some re-prompting to see if any of these can be improved as refactors.

## Part 2

Alright, we're getting some momentum now. Wrote my TDD style test first and then moved on to prompting CP:

> How can I replace all occurences of a substring within a string?

It instructed me to use `str.gsub` so I started `def number_names_to_digits` and CP did the rest.

But... it doesn't work. That's because the sample data shows that some of the letters across number names are re-used -
`eightwothree` is supposed to resolve as `83` but my naive code turns this into `eigh23`. This is going to require a
different approach.

> Can I use integers as keys in a data collection of some type?

Ok, so now I know hashes exist.

> In such a hash, can I select the value stored in the lowest-number key?

Which, amongst some explanation, yielded this code

```ruby
hash = {3 => "three", 1 => "one", 2 => "two"}

lowest_key_value = hash[hash.keys.min]
```

Cool, now I know a decent amount of the syntax for hashes and that they have properties like `keys` which also look to
be array-like and have their own methods like `min` and I presume `max`.

With a bit more fudging by writing a function name and using a naive implementation of `map` it told me about
`filter_map` and I see now how to use that to eliminate values I don't want and that I can convert a 2d array into a
hash with `to_h`.

Updated the tests, ran the solution, and ⭐ :)
