# Problem 49: Prime Permutations
#
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
#
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in this sequence?
#

class Integer
  def prime?
    return true  if [2, 3].include?(self)
    return false if self.even? || self == 1

    sqrt_n = Math.sqrt(self).floor

    !(2..sqrt_n).detect { |num| self % num == 0 }
  end
end


primes = (1488..9999).select { |n| n.prime? }.sort.uniq

match = primes.detect do |n|
  permutation_primes = n.to_s.split("").permutation(4).map(&:join).sort.uniq.select { |x| primes.include? x.to_i }.map(&:to_i)
  next unless permutation_primes.length >= 3
  
  permutation_primes.any? { |x| ([x, x + 3330, x + (2*3330)] - permutation_primes).empty? }
end

puts "#{match}#{match + 3330}#{match + 2*3330}"
# => 269960299359

