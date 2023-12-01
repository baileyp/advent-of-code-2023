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
