

# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.


def factorial(n)
  return 1 if n < 2

  n * factorial(n-1)
end

valid = (3..500_000).to_a.select do |x|
  x.to_s.split("").map { |x| factorial(x.to_i) }.reduce(:+) == x
end

puts valid.reduce(:+)
