arr = File.readlines("input.txt").map {|a| a.gsub("\n", "").to_i}

increases = arr.each_cons(2).reduce(0) do |inc, pair|
  inc += 1 if pair.first < pair.last
  inc
end

p increases