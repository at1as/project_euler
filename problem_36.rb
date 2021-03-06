# Problem 36: Double-Base Palindromes
#
# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#
#  Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
#  (Please note that the palindromic number, in either base, may not include leading zeros.)

def palondromic?(number)
  number.to_s == number.to_s.reverse
end

numbers = (1..999_999).select do |x|
  palondromic?(x) && palondromic?(x.to_s(2))
end

puts numbers.reduce(:+)

# => 872187
