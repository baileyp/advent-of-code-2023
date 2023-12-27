class Day20
  def self.part1(input)
    modules = init_modules(parse_input(input))

    low_pulses = 0
    high_pulses = 0

    1000.times do
      pulses = Queue.new
      pulses << [:button, :broadcaster, :low]

      while pulses.size > 0
        from, to, type = pulses.pop
        low_pulses += 1 if type == :low
        high_pulses += 1 if type == :high
        if modules[:flipflop].has_key?(to)
          if type == :low
            modules[:flipflop][to][:switched] = modules[:flipflop][to][:switched] == :off ? :on : :off
            pulse_to_send = modules[:flipflop][to][:switched] == :off ? :low : :high
            modules[:flipflop][to][:wires].each do |w|
              pulses << [to, w, pulse_to_send]
            end
          end
        elsif modules[:conjunction].has_key?(to)
          modules[:conjunction][to][:receivers][from] = type
          pulse_to_send = modules[:conjunction][to][:receivers].values.all? { |v| v == :high } ? :low : :high
          modules[:conjunction][to][:wires].each do |w|
            pulses << [to, w, pulse_to_send]
          end
        elsif to == :broadcaster
          modules[:broadcaster].each do |w|
            pulses << [to, w, type]
          end
        end
      end
    end
    low_pulses * high_pulses
  end

  def self.part2(input)
    nil
  end

  def self.parse_input(input)
    parsed = {
      broadcaster: [],
      flipflop: {},
      conjunction: {}
    }
    input.split("\n").each_with_object({}) do |line, hash|
      key, value = line.split(' -> ')
      modules = value.split(', ').map(&:to_sym)

      if key.include?('&')
        parsed[:conjunction][key.gsub('&', '').to_sym] = modules
      elsif key.include?('%')
        parsed[:flipflop][key.gsub('%', '').to_sym] = modules
      else
        parsed[:broadcaster] = modules
      end
    end
    parsed
  end

  def self.init_modules(modules)
    flipflop_modules = modules[:flipflop].map do |key, value|
      [key, switched: :off, wires: value]
    end
    conjunction_modules = modules[:conjunction].map do |key, value|
      receivers = {}
      modules[:flipflop].each do |mod, wires|
        if wires.include?(key)
          receivers[mod] = :low
        end
      end
      modules[:conjunction].each do |mod, wires|
        if wires.include?(key)
          receivers[mod] = :low
        end
      end
      [key, receivers: receivers, wires: value]
    end
    { broadcaster: modules[:broadcaster], flipflop: flipflop_modules.to_h, conjunction: conjunction_modules.to_h}
  end
end
