# Ruby Bootstrapping

*Note: In my commits as probably in the rest of this documentation I will refer to Github Copilot Chat simply as CP.*

So of course the first thing I had to do was just get a basic Ruby project started, which I have no idea how to do, so
that was my first prompt:

> I'm starting a brand new Ruby project without Rails. This will be a simple CLI-driven application. Can you help me get
> bootstrapped?

It happily gave me the code in commit [0ab5cd7](https://github.com/baileyp/advent-of-code-2023/commit/0ab5cd7). I didn't
know how to run the tests so I had to ask that as well

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