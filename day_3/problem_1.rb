nums = File.read("input.txt").split("\n")

def gamma_digits(nums)
  firsts = nums.map {|n| n[0]}
  seconds = nums.map {|n| n[1]}
  thirds = nums.map {|n| n[2]}
  fourths = nums.map {|n| n[3]}
  fifths = nums.map {|n| n[4]}
  sixths = nums.map {|n| n[5]}
  sevenths = nums.map {|n| n[6]}
  eighths = nums.map {|n| n[7]}
  ninths = nums.map {|n| n[8]}
  tenths = nums.map {|n| n[9]}
  elevenths = nums.map {|n| n[10]}
  twelfths = nums.map {|n| n[11]}
  gammas = [firsts, seconds, thirds, fourths, fifths, sixths, sevenths, eighths, ninths, tenths, elevenths, twelfths]
  gamma = gammas.map {|g| gamma_rate(g)}.join()
end

def gamma_rate(digits)
  ones, zeros = digits.partition {|d| d == "1"}
  ones.count > zeros.count ? 1 : 0
end

def epsilon_digits(nums)
  firsts = nums.map {|n| n[0]}
  seconds = nums.map {|n| n[1]}
  thirds = nums.map {|n| n[2]}
  fourths = nums.map {|n| n[3]}
  fifths = nums.map {|n| n[4]}
  sixths = nums.map {|n| n[5]}
  sevenths = nums.map {|n| n[6]}
  eighths = nums.map {|n| n[7]}
  ninths = nums.map {|n| n[8]}
  tenths = nums.map {|n| n[9]}
  elevenths = nums.map {|n| n[10]}
  twelfths = nums.map {|n| n[11]}
  epsilons = [firsts, seconds, thirds, fourths, fifths, sixths, sevenths, eighths, ninths, tenths, elevenths, twelfths]
  epsilon = epsilons.map {|e| epsilon_rate(e)}.join()
end

def epsilon_rate(digits)
  ones, zeros = digits.partition {|d| d == "1"}
  ones.count > zeros.count ? 0 : 1
end

def convert_to_decimal(num)
  total = 0
  num.each_char.with_index do |num, idx|
    case idx
    when 0
      num == "1" ? total += 2048 : total += 0
    when 1
      num == "1" ? total += 1024 : total += 0
    when 2
      num == "1" ? total += 512 : total += 0
    when 3
      num == "1" ? total += 256 : total += 0
    when 4
      num == "1" ? total += 128 : total += 0
    when 5
      num == "1" ? total += 64 : total += 0
    when 6
      num == "1" ? total += 32 : total += 0
    when 7
      num == "1" ? total += 16 : total += 0
    when 8
      num == "1" ? total += 8 : total += 0
    when 9
      num == "1" ? total += 4 : total += 0
    when 10
      num == "1" ? total += 2 : total += 0
    when 11
      num == "1" ? total += 1 : total += 0
    end
  end
  total
end

def calculate_power_consumption(nums)
  convert_to_decimal(gamma_digits(nums)) * convert_to_decimal(epsilon_digits(nums))
end

p gamma_digits(nums)
p convert_to_decimal(gamma_digits(nums))

p epsilon_digits(nums)
p convert_to_decimal(epsilon_digits(nums))

p calculate_power_consumption(nums) # should equal 2035764