#
#  The prime factors of 13195 are 5, 7, 13 and 29.
#
#  What is the largest prime factor of the number 600851475143 ?
#

def is_prime(number)
  return false if number < 3 || number.even?

  square = Math.sqrt(number).to_i

  !(3..square).any? { |x| number % x == 0 }
end


def get_prime_list(limit)
  prime_range = (0..Math.sqrt(limit).to_i).select(&:odd?).select { |x| limit % x == 0 }.reverse
  
  prime_range.each do |x|
    return x if is_prime(x)
  end
end


puts get_prime_list(600_851_475_143)

# => 6857
