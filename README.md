# Advent of Code 2023

These are my solutions for the [2023 Advent of Code puzzles](https://adventofcode.com/2023).

## Requirements

 1. Latest Ruby (as of the time of this project) with RSpec

## Setup

None, other than satisfying the requirements

## Running

```bash
ruby bin/run.rb
```

## Goals

I don't know [Ruby](https://www.ruby-lang.org/en/), but my team is using it heavily in our current product. But
I don't know Ruby.

Yet, this year, not only am I going write all of my puzzles solutions in Ruby, but I will do so with no official
or un-official language references, no Stack Overflow, and no googling.

The only aid I will use is Github Copilot.

What I will _not_ be doing is consulting AI for algorithmic help - the puzzle solving will still come from my
brain and I will use AI solely for getting things done with Ruby.

In additon to writing solutions to the puzzles, I will also see how far I can push Copilot in terms of writing
unit tests, documentation, and whatever else comes to mind as I begin. I will also endeavor to keep a log/blog
of my experiences but that will likely suffer the natural limitations of time that always occur in December.

Happy coding!

---
## Ruby Bootstrapping

*Note: In my commits as probably in the rest of this documentation I will refer to Github Copilot Chat simply as CP.*

So of course the first thing I had to do was just get a basic Ruby project started, which I have no idea how to do, so
that was my first prompt:

> I'm starting a brand new Ruby project without Rails. This will be a simple CLI-driven application. Can you help me get
> bootstrapped?

It happily gave me the code in commit `0ab5cd7`. I didn't know how to run the tests so I had to ask that as well

> How do I run the tests?

It told me to use `rspec` which I already had installed (as so with `ruby`) but when I ran it I got an error

```bash
% rspec spec
rbenv: rspec: command not found

The `rspec' command exists in these Ruby versions:
  3.2.2
```

Looks like I only had 2.6.10 installed so back to the prompt:

> I seem to only have ruby 2.6.10 installed and it looks like rspec requires a minimum of 3.2.2. How can I install the
> latest ruby version?

It said I could use `rbenv` (which I already am) or `rvm` so I followed the `rbenv` instructions and then got successful
tests - huzzah!

```bash
% rspec spec
.

Finished in 0.00322 seconds (files took 0.31603 seconds to load)
1 example, 0 failures
```

The bootsrapped app works as well

```bash
% ruby bin/run.rb
Hello, world!
```

---
## Advent of Code Bootstrapping

Now that I have a basic ruby CLI app, I need to get my project ready for running AoC puzzles the way I've been doing it
for years

- The puzzle input I receive is stored in a `.txt` file
- The CLI entrypoint takes two args, one for the `day` and one for the `part` i.e., `ruby bin/run.rb 1 1` would run the
  Day 1, Part 1 puzzle solver
- The CLI is a handler that reads the args, opens the correct input file, and then passes it off to the puzzle solver

First prompt to get me started

> My CLI app needs to read two command line arguments. The first will be an integer in the range from 1 to 25 and will
> be the `day` argument, and the second will be an integer in the range from 1 to 2 and will be the `part` argument.

The result of this is visible in commit `ef19a53` but the response also suggested follow-ups

> Next steps could include:
>
> - Implementing the puzzle solving logic for each day and part
> - Reading the puzzle input from a file based on the `day` argument
> - Adding error handling for invalid puzzle inputs

I sent the first suggesting back in as a prompt and it gave me new code for `MyCli.run` but no test changes. That was
easily solved by highilighting the new code and using the contextual prompt for `/tests`. These changes are in commit
`d8a3668`.

So far I haven't written a single line of ruby.

Next:

> Ok, now that I have the `day` and `part` arguments going, `MyCli.run` needs to use these to open a text file that
matches by convention, for example if `day` is `3` and `part` is `2` then it should open the text file `input/day03.txt`
and pass the file handle or file contents off to another class or function such as `Day03.part2`

Here's where I hit my first snag. In re-applying the `/tests` for `MyCLI.run` it generated a test like this:

```ruby
it "reads the input file for the specified day" do
  allow(File).to receive(:read).with("input/day03.txt").and_return("input content")
  expect(Day03).to receive(:part2).with("input content")
  MyCli.run(3, 2)
end
```

This, of course, failed since `Day03` doesn't exist yet nor does the input file. I returned to the contextual prompt and
asked it how to mock this which did work:

```ruby
it "calls the correct part method on the specified day class" do
  allow(File).to receive(:read).with("input/day03.txt").and_return("input content")

  day03_mock = double("Day03")
  expect(day03_mock).to receive(:part2).with("input content")

  allow(Object).to receive(:const_get).with("Day03").and_return(day03_mock)

  MyCli.run(3, 2)
end
```

Now the tests pass. I'm accustomed to unit tests being side-effect free so this was a little annoying but manageable.
Anyway, results are in commit `4e7dbf3`.

My final prompt was to put the printing of the output responsibility back onto the runner, and the handler for each
day/part will just return.

> I'd like `MyCli.run` to take the return value of `day_class.send` and print it, which also means `Day01.part` needs to
> return a value instead of printing it.

Very simple tweak which I could have probably done on my own but the results are in commit `bcf5bce`.

Now I'm all set and ready for the first puzzle to drop, and I *still* haven't written any ruby myself. Bizarre.