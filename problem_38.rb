# Problem 38: Pandigital Multiples
#
# Take the number 192 and multiply it by each of 1, 2, and 3:
#
#     192 × 1 = 192
#     192 × 2 = 384
#     192 × 3 = 576
#
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
#
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
#
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

class Integer
  def pandigital?
    self.to_s.split("").sort.reject { |x| x == "0" }.uniq.length == 9
  end
end


pandigital_products = (10..10_000).map do |x|
  products = []
  
  (1..100).each do |multiplier|
    products << x * multiplier
    break if products.map(&:to_s).join.length >= 9
  end

  if products.map(&:to_s).join.to_s.to_i.pandigital?
    if products.map(&:to_s).join.length == 9
      products.map(&:to_s).join.to_i
    else
      nil
    end
  else
    nil
  end
end


puts "#{pandigital_products.reject(&:nil?).max }"

# => 932718654
