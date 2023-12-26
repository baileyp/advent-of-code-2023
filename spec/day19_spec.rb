require_relative '../lib/day19'

describe Day19 do
  input = <<~INPUT
    px{a<2006:qkq,m>2090:A,rfg}
    pv{a>1716:R,A}
    lnx{m>1548:A,A}
    rfg{s<537:gd,x>2440:R,A}
    qs{s>3448:A,lnx}
    qkq{x<1416:A,crn}
    crn{x>2662:A,R}
    in{s<1351:px,qqz}
    qqz{s>2770:qs,m<1801:hdj,R}
    gd{a>3333:R,R}
    hdj{m>838:A,pv}

    {x=787,m=2655,a=1222,s=2876}
    {x=1679,m=44,a=2067,s=496}
    {x=2036,m=264,a=79,s=2244}
    {x=2461,m=1339,a=466,s=291}
    {x=2127,m=1623,a=2188,s=1013}
  INPUT

  describe ".part1" do
    it "returns the solution to part 1" do
      expect(Day19.part1(input)).to eq(19114)
    end
  end

  describe ".part2" do
    it "returns the solution to part 2" do
      expect(Day19.part2(input)).to eq(167409079868000)
    end
  end

  describe ".parse_part" do
    it "returns a hash of the part" do
      expect(Day19.parse_part("{x=787,m=2655,a=1222,s=2876}")).to eq({x: 787, m: 2655, a: 1222, s: 2876})
    end
  end

  describe ".parse_workflow" do
    it "returns a hash of the workflow" do
      workflow = [
        :px, [
          {goto: :qkq, field: :a, op: :<, value: 2006},
          {goto: :A, field: :m, op: :>, value: 2090},
          {goto: :rfg}
        ]
      ]
      expect(Day19.parse_workflow("px{a<2006:qkq,m>2090:A,rfg}")).to eq(workflow)
    end
  end
end
