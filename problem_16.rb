# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
#  What is the sum of the digits of the number 2^1000?

puts (2 ** 1000).to_s.chars.map(&:to_i).inject(0) { |x, y| x + y }

# => 1366

