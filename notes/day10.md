# Day 10

## Part 1

Not the prettiest code I've written, but I did manage to do the entire solution with only tab-complete help from CP,
which continues to impress me.

I did prompt CP for a simple version of my `locate_next_pipe` function but I didn't accept the result, I just wanted to
see what it proposed:

```ruby
def self.locate_next_pipe(location, from, field)
  directions = [[0, 1, @@L_TO_R, @@R_TO_L], [0, -1, @@R_TO_L, @@L_TO_R], [1, 0, @@U_TO_D, @@D_TO_U], [-1, 0, @@D_TO_U, @@U_TO_D]]

  directions.each do |dx, dy, valid_from, valid_to|
    new_location = [location[0] + dx, location[1] + dy]
    if valid_location?(new_location, from, field, valid_from, valid_to)
      return new_location
    end
  end

  raise "No next location found for #{location[0]},#{location[1]} from #{from[0]},#{from[1]}"
end

def self.valid_location?(location, from, field, valid_from, valid_to)
  row, col = location
  return false if location == from
  return false if row < 0 || row >= field.length || col < 0 || col >= field[row].length
  return false unless valid_from.include?(field[row][col]) && valid_to.include?(field[from[0]][from[1]])

  true
end
```

Any any rate, my solution worked just fine so ⭐

## Part 2

Fortunately, I alredy know at least one method for determining if a point is inside a polgon and it's called
[ray casting](https://en.wikipedia.org/wiki/Point_in_polygon#Ray_casting_algorithm). Still, this wouldn't work with the
field as defined so first I had to write functions to both correctly determind what pipe was at the starting point _and_
to clean up all the junk pipe laying around.

Once I had those done I was able to beat up my ray casting function with unit tests based on the sample input until it
worked, and when it did... ⭐! It's not the fastest solution - takes around 18 seconds on this M2 Pro Macbook. Not sure
which function is the slowest but speed optimization is not one of my goals this year. Maybe as an exercise for a later
day I'll come back and profile this.
