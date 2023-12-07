# Day 4

## Part 1

Yet another day where I wrote the unit tests first and prompted CP to write code that would satisfy them. Well, for the
`parse_line` and `find_matching_numbers` functions anyway, the `part1` function is all me. If I were still a engineer at
my day job, I think I'd quite enjoy this paradigm.

The solution was so easy I decided to work in a new CP prompt - `/doc` to write doc blocks for these functions. What you
see in the `Day04` module is 100%, word-for-word, character-for-character written by CP.

## Part 2

I didn't find this too hard but as I was typing the code for `part2` CP gave me a suggestion that I accepted but didn't
100% understand, so enter `/explain` again on this line:

```ruby
scratchcards[card_number + i][:copies] += card.dig(:copies)
```

And now I know about symbol literals and the purpose of `hash.dig` over `hash[]`.