# lib/my_cli.rb
require 'fileutils'

class MyCli
  def self.run(day, part)
    filename = format("input/day%02d.txt", day)
    input = File.read(filename)

    day_class = Object.const_get("Day#{day.to_s.rjust(2, '0')}")
    result = day_class.send("part#{part}", input)

    puts result
  end

  def self.new(day)
    day_str = day.to_s.rjust(2, '0')

    copy_and_replace_template('bin/_template_day.rb', "lib/day#{day_str}.rb", day_str)
    copy_and_replace_template('bin/_template_spec.rb', "spec/day#{day_str}_spec.rb", day_str)
    copy_and_replace_template('bin/_template_notes.md', "notes/day#{day}.md", day.to_s)
    File.open("input/day#{day_str}.txt", 'w') { |file| file.puts "" }

    # Append a line to README.md
    open('README.md', 'a') do |f|
      f.puts "- [Day #{day}](./notes/day#{day}.md)\n"
    end
  end

  def self.copy_and_replace_template(template_file, destination_file, day_str)
    # Copy the file
    FileUtils.cp(template_file, destination_file)

    # Replace all instances of 'XX' with the day number
    text = File.read(destination_file)
    new_text = text.gsub('XX', day_str)
    File.open(destination_file, 'w') { |file| file.puts new_text }
  end
end