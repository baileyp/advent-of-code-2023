# lib/my_cli.rb

class MyCli
  def self.run(day, part)
    filename = format("input/day%02d.txt", day)
    input = File.read(filename)

    day_class = Object.const_get("Day#{day.to_s.rjust(2, '0')}")
    result = day_class.send("part#{part}", input)

    puts result
  end
end