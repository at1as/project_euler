# 10001st prime
#   https://projecteuler.net/problem=7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10,001st prime number?


def prime?(number)
  return false if number <= 1

  sqrt = Math.sqrt(number).to_i
  (1..sqrt).select { |x| number % x == 0 }.count < 2
end


def nth_prime(target_idx, limit)
  nth_prime = 0

  (0..limit).each do |num| 
    nth_prime += 1 if prime?(num)
    return num if nth_prime == target_idx
  end
end


puts nth_prime(10_001, 1_000_000_000)

# => 104743
