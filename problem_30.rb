# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
#    1634 = 1^4 + 6^4 + 3^4 + 4^4
#    8208 = 8^4 + 2^4 + 0^4 + 8^4
#    9474 = 9^4 + 4^4 + 7^4 + 4^4
#
# As 1 = 1^4 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

# Limit should be higher than 99_999 since some 6, 7, or higher digit numbers
# may still satisfy the rule. Arbitrarily choosing this value, but it may need
# to be increased
LIMIT = 999_999

numbers = (10..LIMIT).select do |x|
  x.to_s.split("").map { |digit| digit.to_i ** 5 }.reduce(:+).to_s == x.to_s
end

puts numbers.reduce(:+)

# => 443839

