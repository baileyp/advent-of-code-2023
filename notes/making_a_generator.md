# Making a generator

After Day 6 I decided to take a small break from puzzling and make a little meta-programming style  generator that would use template files to boostrap everything I needed for a single day. Here's the prompt I gave to CP:

I'd like to have a ruby function that performs the following actions

- Take an input like `09` and with that value
- Copy the file `bin/_template_day.rb` to `lib/day09.rb`
- Replace all instances of `XX` inside `lib/day09.rb` with `09`
- Append a line to the existing file `README.md` like this `- [Day 9](./notes/day9.md)`

Can you write such a function?

Here is what it gave me for use in the MyCli module:

```ruby
def self.new(day)
  day_str = day.to_s.rjust(2, '0')

  # Copy the file
  FileUtils.cp('bin/_template_day.rb', "lib/day#{day_str}.rb")

  # Replace all instances of 'XX' with the day number
  text = File.read("lib/day#{day_str}.rb")
  new_text = text.gsub('XX', day_str)
  File.open("lib/day#{day_str}.rb", 'w') { |file| file.puts new_text }

  # Append a line to README.md
  open('README.md', 'a') do |f|
    f.puts "- [Day #{day}](./notes/day#{day_str}.md)"
  end
end
```

I just pasted it in and ran it and was greeted with this error:

```
./lib/my_cli.rb:18:in `new': uninitialized constant MyCli::FileUtils (NameError)

    FileUtils.cp('bin/_template_day.rb', "lib/day#{day_str}.rb")
    ^^^^^^^^^
Did you mean?  FileTest
        from bin/new.rb:8:in `<main>'
```

So I asked CP what was up:

> This code gives me the following error when I run it, can you tell what's wrong?
>
> ./lib/my_cli.rb:18:in `new': uninitialized constant MyCli::FileUtils (NameError)

I figured it was a missing require but, you know, since I'm testing CP's capabilities I figured I'd go this route.

Ok, I made a couple tweaks but this works. Of course, I want this generator to make three new files for me, not just one. Let's see how CP handle an "extract method" refactor request. I highlighted the relevant code and asked:

> Can you apply an extract method refactor of the highlighted code?

Here's what it gave me

```ruby
def self.copy_and_replace_template(day_str)
  # Copy the file
  FileUtils.cp('bin/_template_day.rb', "lib/day#{day_str}.rb")

  # Replace all instances of 'XX' with the day number
  text = File.read("lib/day#{day_str}.rb")
  new_text = text.gsub('XX', day_str)
  File.open("lib/day#{day_str}.rb", 'w') { |file| file.puts new_text }
end
```

As you can see, this solution is not exactly what I'd want since the source and destination files are not parameterized.

> I need the template file that is copied and the destination file that is written to be arguments as well.

Here's the first time so far this experiment that I've seen CP really struggle with the context, since it did this refactor for `MyCli.new` instead of `MyCli.copy_and_replace_template`.

> No, I meant they need to be arguments of the proposed `copy_and_replace_template` function

Maybe this is partly on me for not being specific enough with subsequent prompts, but I think the expectation I had was fairly reasonable.

At any rate, after I made a few tweaks, my generator was complete!
