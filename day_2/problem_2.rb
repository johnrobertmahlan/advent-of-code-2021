directions = File.read("input.txt").split("\n")

def check_directions(directions)
  aim = 0
  horizontal = 0
  depth = 0

  directions.each do |direction|
    dir, vector = direction.split("\s")
    case dir
    when 'up'
      aim -= vector.to_i
    when 'down'
      aim += vector.to_i
    when 'forward'
      horizontal += vector.to_i
      depth += aim * vector.to_i
    end
  end
  horizontal * depth
end

p check_directions(directions)