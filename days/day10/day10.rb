module Day10
  def self.parse(input)
    input.lines.map do |line|
      [
        line[/[.#]+/],
        line.scan(/(?<=\()[\d,]+?(?=\))/).map { |button| button.split(",").map(&:to_i) },
        line[/(?<={)[\d,]+?(?=})/].split(",").map(&:to_i)
      ]
    end
  end

  # 519 too low
  def self.part1(input)
    parse(input).sum do |machine|
      lights_goal, buttons, _ = machine
      search_for_combination(
        lights_goal.chars.map { |c| c == "#" },
        buttons,
        0,
        50,
        [false] * lights_goal.size
      )
    end
  end

  @@mem = {}
  def self.search_for_combination(lights_goal, buttons, depth, best_depth, state)
    return depth if state == lights_goal
    return -1 if depth >= best_depth

    buttons.each do |button|
      new_state = state.map.with_index { |l, i| button.include?(i) ? !l : l }
      if @@mem[new_state]
        best_depth = depth + @@mem[new_state] + 1
      end
      new_state_depth = search_for_combination(
        lights_goal,
        buttons,
        depth + 1,
        best_depth,
        new_state
      )
      if new_state_depth >= 0
        best_depth = [best_depth, new_state_depth].min
      end
    end
    @@mem[state] = best_depth
    best_depth
  end

  def self.part2(input)
  end
end
