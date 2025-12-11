module Day11
  def self.parse(input)
    devices = {}
    input.split("\n").each do |line|
      current, outputs = line.split(":").map(&:split)
      devices[current.first] = outputs
    end
    devices
  end

  def self.part1(input)
    devices = parse(input)
    you_to_out(devices, "you")
  end

  @@mem = {}
  def self.you_to_out(devices, current)
    return 1 if devices[current].include?("out")
    return @@mem[current] if @@mem[current]

    devices[current].sum do |device|
      @@mem[device] = you_to_out(devices, device)
    end
  end

  def self.part2(input)
    devices = parse(input)
    svr_to_out(devices, ["svr"])
  end

  @@mem_svr = {}
  def self.svr_to_out(devices, path)
    valid = path.include?("fft") && path.include?("dac")
    return valid ? 1 : 0 if path.last == "out"
    current = path.last
    return @@mem_svr[current] if valid && @@mem_svr[current]

    r = devices[current].sum do |device|
      svr_to_out(devices, path + [device])
    end
    @@mem_svr[current] = r if valid
    r
  end
end
