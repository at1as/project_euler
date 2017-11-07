# Problem 21 – Amicable Numbers 
#
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.
#

def divisors(n)
	(n-1).downto(1).select do |x|
		n % x == 0
	end
end


divisor_sums = {}
(1..10_000).each do |num|
	divisor_sums[num] = divisors(num).reduce(&:+)
end

sum = divisor_sums.to_a.select { |x| divisor_sums.to_a.count(x.reverse) > 0 }.uniq.reject { |x| x[0] == x[1] }.flatten.uniq.reduce(&:+)

puts sum

# => 31626
