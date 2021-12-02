directions = File.read("input.txt").split("\n")

def check_directions(directions)
  horizontal = 0
  depth = 0
  directions.each do |direction|
    dir, vector = direction.split("\s")
    case dir
    when 'forward'
      horizontal += vector.to_i
    when 'up'
      depth -= vector.to_i
    when 'down'
      depth += vector.to_i
    end
  end
  horizontal * depth
end

p check_directions(directions)