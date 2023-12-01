# spec/my_cli_spec.rb

require_relative '../lib/my_cli'

describe MyCli do
  describe ".run" do
    it "runs puzzle for specific day and part" do
      expect { MyCli.run(3, 2) }.to output("Running puzzle for day 3, part 2\n").to_stdout
    end
  end
end