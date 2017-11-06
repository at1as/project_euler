#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
#

def hello(limit)
  (1..limit).each do |num|
    return num if (2..20).to_a.reverse.all? { |x| num % x == 0 }
  end
end

# Slow, slow, slow. But it works
# TODO: Speed up
puts hello(1_000_000_000)

# => 232792560

