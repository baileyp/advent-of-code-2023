# bin/new.rb

require_relative '../lib/my_cli'

day = ARGV[0].to_i

if day.between?(1, 25)
  MyCli.new(day)
else
  puts "Invalid arguments. Day must be between 1 and 25"
end