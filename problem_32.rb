# Problem 32: Pandigital Products
#
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

products = (0..10_000).to_a.product((0..100).to_a)

product_results = products.map { |x| [x[0], x[1], x[0]*x[1]] }

pandigital_products = product_results.select do |x|
  next if x.reduce(0) { |acc, num| acc + num.to_s.length } != 9

  ("1".."9").zip([x[0], x[1], x[2]].flatten.inject("") {|acc, s| "#{acc}#{s}" }.split("").sort).all? { |y| y[0] == y[1] }
end

puts pandigital_products.map { |x| x[2] }.sort.uniq.flatten.reduce(:+)
# => 45228

