# https://projecteuler.net/problem=4
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
#


def get_products
  combos = (100..999).map do |num1|
    (100..999).map do |num2|
      num1 * num2
    end
  end

  combos.flatten.uniq
end
     
class Integer
  def palindromic?
    self.to_s == self.to_s.reverse
  end
end

puts get_products.select(&:palindromic?).max

# => 906609

