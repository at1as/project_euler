# Problem 33: Digit Cancelling Fractions
#
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

digits = (10..99).to_a

# Remove fractions greater than one, trivial fractions, and fractions that contain no mutual numbers in numerator and denominator
fractions = digits.product(digits).select { |x| x[0] < x[1] }
fractions = fractions.reject { |x| x[0] % 10 == 0 && x[1] % 10 == 0 }
fractions = fractions.reject { |x| x.any? { |num| num.to_s.split("").uniq.length == 1 } }
fractions = fractions.select { |x| (x[0].to_s.split("") & x[1].to_s.split("")).length > 0 }


digit_cancelling = fractions.select do |x|

  fraction_nums = [x[0], x[1]].flatten.map(&:to_s).map { |x| x.split("") }.flatten
  repeat_values = fraction_nums.select { |x| fraction_nums.count(x) > 1 }.uniq

  reduced_fractions = repeat_values.map do |r|
    x.map { |n| n.to_s.delete(r).to_i }
  end

  reduced_fractions.reject { |n| n.any? {|num| num == 0} }.any? do |f| 
    (f[0].to_f / f[1].to_f) == (x[0].to_f / x[1].to_f)
  end

end

# Multiply Fractions
fraction_result = digit_cancelling.inject([1, 1]) { |acc, fraction| [acc[0] * fraction[1] , acc[1] * fraction[0]] }

puts fraction_result[0] / fraction_result[1].gcd(fraction_result[0])
# => 100

