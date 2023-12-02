# bin/run.rb

require_relative '../lib/my_cli'
require_relative '../lib/day01'
require_relative '../lib/day02'

day = ARGV[0].to_i
part = ARGV[1].to_i

if day.between?(1, 25) && part.between?(1, 2)
  MyCli.run(day, part)
else
  puts "Invalid arguments. Day must be between 1 and 25, part must be between 1 and 2."
end