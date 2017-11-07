# Problem 10: Summation of Primes
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
#  Find the sum of all the primes below two million.


def prime?(n)
  return true  if [2,3].include? n
  return false if n.even? || n == 1

  # factors will never exceed the root of the number
  sqrt_n = Math.sqrt(n).floor

  factors = !(2..sqrt_n).detect do |num|
    n % num == 0
  end

end


def primes(limit)
  (0..limit).select do |n|
    prime?(n)
  end
end

puts primes(2_000_000).reduce(&:+)

