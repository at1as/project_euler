# Problem 40: Champernowne's constant
#
# An irrational decimal fraction is created by concatenating the positive integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

x = (1..200_000).map(&:to_s).join

puts x[1_000_000-1], x[100_000-1], x[10_000-1], x[1_000-1], x[100-1], x[10-1], x[1-1]].map(&:to_i).inject(1) { |x, acc| x * acc }

# => 210
