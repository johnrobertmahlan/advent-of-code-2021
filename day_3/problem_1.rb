nums = File.read("input.txt").split("\n")

MAX_IDX = 12

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

def calculate(nums)
  idx = 0
  gamma_digits = []
  epsilon_digits = []

  loop do
    digits = nums.map {|n| n[idx]}
    new_gamma_digit = gamma_rate(digits)
    new_epsilon_digit = epsilon_rate(digits)
    gamma_digits.push(new_gamma_digit)
    epsilon_digits.push(new_epsilon_digit)
    idx += 1
    break if idx == MAX_IDX
  end
  gamma = gamma_digits.join
  epsilon = epsilon_digits.join

  calculate_power_consumption(convert_to_decimal(gamma), convert_to_decimal(epsilon))
end

def gamma_rate(digits)
  ones, zeros = digits.partition {|d| d == "1"}
  ones.count > zeros.count ? 1 : 0
end

def epsilon_rate(digits)
  ones, zeros = digits.partition {|d| d == "1"}
  ones.count > zeros.count ? 0 : 1
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

def calculate_power_consumption(gamma, epsilon)
  gamma * epsilon
end

p calculate(nums)