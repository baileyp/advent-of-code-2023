class Day19
  def self.part1(input)
    raw_workflows, parts = parse_input(input)
    workflows = raw_workflows.map { |workflow| [workflow.first, make_workflow(workflow.last)] }.to_h

    ratings = []
    workflows[:A] = -> (workflows, part) { ratings << part.values.sum }
    workflows[:R] = -> (workflows, part) {}

    parts.each { |part| workflows[:in].call(workflows, part) }

    ratings.sum
  end

  def self.part2(input)
    raw_workflows, parts = parse_input(input)
    workflows = raw_workflows.map { |workflow| [workflow.first, make_workflow_2(workflow.last)] }.to_h

    chains = []
    workflows[:A] = -> (workflows, chain) { chains << chain }
    workflows[:R] = -> (workflows, chain) {}

    workflows[:in].call(workflows, {x: [1, 4000], m: [1, 4000], a: [1, 4000], s: [1, 4000]})

    chains
      .map do |chain|
        chain
          .values
          .map { |from, to| (to - from + 1) || 0 }
          .inject(:*)
      end
      .sum
  end

  def self.parse_part(line)
    part = line[1..-2]  # remove the curly braces
    part.split(',').each_with_object({}) do |element, hash|
      key, value = element.split('=')
      hash[key.to_sym] = value.to_i
    end
  end

  def self.parse_input(input)
    workflows, parts = input.split("\n\n")
    [
      workflows.split("\n").map { |line| parse_workflow(line) },
      parts.split("\n").map { |line| parse_part(line) }
    ]
  end

  def self.parse_workflow(workflow)
    workflow_name, conditions = workflow.split('{')
    conditions = conditions[0..-2]  # remove the closing brace

    conditions = conditions.split(',').map do |condition|
      if condition.include?(':')
        field, value, goto, op = condition.split(/[:<>]/)
        op = condition[/[<>]/]
        { goto: goto.to_sym, field: field.to_sym, op: op.to_sym, value: value.to_i }
      else
        { goto: condition.to_sym }
      end
    end

    [workflow_name.to_sym, conditions]
  end

  def self.make_workflow(rules)
    -> (workflows, part) {
      rules.each do |rule|
        goto, field, op, value = rule[:goto], rule[:field], rule[:op], rule[:value]
        return workflows[goto].call(workflows, part) if !op
        return workflows[goto].call(workflows, part) if [part[field], value].inject(op)
      end
    }
  end

  def self.make_workflow_2(rules)
    -> (workflows, quantities) {
      remainders = {**quantities}
      rules.each do |rule|
        goto, field, op, value = rule[:goto], rule[:field], rule[:op], rule[:value]
        from, to = quantities[field]

        if op == :<
          workflows[goto].call(workflows, {**remainders, field => [from, [to, value - 1].min]})
          remainders = {**remainders, field => [[from, value].max, to]}
        elsif op == :>
          workflows[goto].call(workflows, {**remainders, field => [[from, value + 1].max, to]})
          remainders = {**remainders, field => [from, [to, value].min]}
        else
          workflows[goto].call(workflows, {**remainders})
        end
      end
    }
  end
end
