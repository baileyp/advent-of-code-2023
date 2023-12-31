require 'thread'

class Day08
  def self.part1(input)
    instructions, graph = parse_input(input)

    instruction = instructions.pop
    node = :AAA
    steps = 0
    while node != :ZZZ do
      node = graph[node][instruction]
      steps += 1
      instructions << instruction
      instruction = instructions.pop
    end
    steps
  end

  def self.part2(input)
    line_one, rest = input.split("\n\n")
    graph = parse_graph(rest)

    graph
      .keys
      .find_all do |node| node.to_s.end_with?("A") end
      .map{ |node| locate_z(node, parse_instructions(line_one), graph) }
      .inject(:lcm)
  end

  def self.parse_input(input)
    instructions, graph = input.split("\n\n")
    [parse_instructions(instructions), parse_graph(graph)]
  end

  def self.parse_instructions(raw_instructions)
    Queue.new(raw_instructions.split("").map(&:to_sym))
  end

  def self.parse_graph(raw_graph)
    graph = raw_graph.split("\n").map do |line|
      parent, children = line.split(" = ")
      children = children.gsub("(", "").gsub(")", "").split(", ").map(&:to_sym)
      [parent.to_sym, {:L => children[0], :R => children[1]}]
    end
    graph.to_h
  end

  def self.locate_z(root_node, instructions, graph)
    instruction = instructions.pop
    node = root_node.dup
    steps = 0
    while !node.to_s.end_with?("Z") do
      node = graph[node][instruction]
      steps += 1
      instructions << instruction
      instruction = instructions.pop
    end
    steps
  end
end
