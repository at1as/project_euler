# Special Pythagorean triplet
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which, a^2 + b^2 = c^2
#
#  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
#    There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#    Find the product abc.
#

def pythagorean_triplet(target)
  (1..1000).to_a.each do |a|
    (a..1000).to_a.each do |b|
      (b..1000).to_a.each do |c|
        if a + b + c == target && a**2 + b**2 == c**2
          return a * b * c
        end
      end
    end
  end

  nil
end

puts pythagorean_triplet(1000)

# => 31875000

