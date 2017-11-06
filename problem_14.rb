# The following iterative sequence is defined for the set of positive integers:
#
#  n → n/2 (n is even)
#  n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#   13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
#  Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.
#


def collatz(input_number, iterations = 0)
  return iterations if input_number < 2

  if input_number.odd?
    next_number = (3 * input_number) + 1
  else
    next_number = input_number / 2
  end

  if next_number == 1
    return iterations + 1
  else
    return collatz(next_number, iterations + 1)
  end
end


values = Hash.new(0)

(0..1_000_000).each do |num|
  values[num] = collatz(num)
end

puts values.sort_by { |x, y| y }.reverse.first[0]

# => 837799

