# Problem 27 : Truncatable Primes
#
# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

class Integer
  def prime?
    return false if self < 2

    sqrt = Math.sqrt(self).floor

    # TODO: Using all? here would be faster since computation of the rest of the sequence would stop upon violation
    (1..sqrt).select { |x| self % x == 0 }.length == 1
  end
end

def number_combos(number)
  # "1234"  => ["1234" , "234", "34", "4"]
  number.to_s.split("").each_index.map { |i| number.to_s[i..number.to_s.length-1] }
end


truncatable_primes = (10...1_000_000).select do |num|
  number_combos(num).all? { |x| x.to_i.prime? } && 
    number_combos(num.to_s.reverse).map(&:reverse).all? { |x| x.to_i.prime? } &&
      !num.to_s.include?("0")
end

puts "#{truncatable_primes.reduce(:+)}"
# => 748317

