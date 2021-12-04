nums = File.read("input.txt").split("\n")

BINARY_MAPPING = {
  0   => 2048,
  1   => 1024,
  2   => 512,
  3   => 256,
  4   => 128,
  5   => 64,
  6   => 32,
  7   => 16,
  8   => 8,
  9   => 4,
  10  => 2,
  11  => 1
}

MAX_IDX = 12

def oxygen_generator(nums)
  count = nums.length
  count.times do |idx|
    selected = get_most_common_digits(idx, nums)
    return selected[0] if selected.count == 1
    nums = selected
  end
end

def co2_scrubber(nums)
  count = nums.length
  count.times do |idx|
    selected = get_least_common_digits(idx, nums)
    return selected[0] if selected.count == 1
    nums = selected
  end
end

def get_most_common_digits(idx, nums)
  digits = nums.map {|n| n[idx]}
  selected = nums.select {|n| n[idx].to_i == find_most_common_digit(digits)}
end

def get_least_common_digits(idx, nums)
  digits = nums.map {|n| n[idx]}
  selected = nums.select {|n| n[idx].to_i == find_least_common_digit(digits)}
end

def find_most_common_digit(arr)
  ones, zeros = arr.partition { |a| a == "1" }
  ones.count >= zeros.count ? 1 : 0
end

def find_least_common_digit(arr)
  ones, zeros = arr.partition { |a| a == "1" }
  ones.count >= zeros.count ? 0 : 1
end

def convert_to_decimal(num)
  total = 0
  idx = 0
    
  loop do
    if num[idx].to_i == 1
      total += BINARY_MAPPING[idx]
    end
      idx += 1
      break if idx == MAX_IDX
    end
  total
end

def calculate_life_support_rating(num1, num2)
  convert_to_decimal(num1) * convert_to_decimal(num2)
end

p calculate_life_support_rating(oxygen_generator(nums), co2_scrubber(nums))