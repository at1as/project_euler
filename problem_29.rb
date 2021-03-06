# Problem 29
# How many distinct terms are in the sequence generated by a^b for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?

class Numeric
  def normalize(exp)
    #
    # 2.normalize(3)
    #   => [2, 3] => [2^3, 1] => [8, 1]
    #

    sqrt = Math.sqrt(exp).floor

    (sqrt..self).each do |i|
      next if i == 1
      r = self ** (1.to_f / i)

      return [r, (exp * i).to_f] if r == r.to_i
    end

    [self.to_f, exp.to_f]
  end
end


SIZE = 100
a = (2..SIZE)
b = (2..SIZE)

combinations = a.to_a.product(b.to_a).uniq

# Normalize entries to their smallest exponentials [4,2] -> [2,4], so repeat values can be removed
#   n.b. This optimization is probably worse than simply skipping this step
unique_combinations = combinations.map { |x| x[0].normalize(x[1]) }.uniq

# Calculate value of remaining values so that different exponentials with same result will
# not be counted multiple times
puts "#{ unique_combinations.map {|x| x[0] ** x[1] }.uniq.size }"

# => 9183
