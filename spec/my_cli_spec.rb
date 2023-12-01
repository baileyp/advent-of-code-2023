# spec/my_cli_spec.rb

require_relative '../lib/my_cli'

describe MyCli do
  describe ".run" do
    it "prints a greeting" do
      expect { MyCli.run }.to output("Hello, world!\n").to_stdout
    end
  end
end