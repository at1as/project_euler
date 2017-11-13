# Problem 41: Pandigital Prime
#
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?

class Integer
  def prime?
    return false if self < 2
    return true  if self == 2

    sqrt = Math.sqrt(self).floor
    (2..sqrt).to_a.reverse.all? { |x| self % x != 0 }
  end

  def pandigital?
    digits = self.to_s.split("").uniq

    digits.length == self.to_s.length && (1..self.to_s.length).all? { |x| self.to_s.include? x.to_s }
  end
end

pandigitals = (1..10_000_000).select do |x|
  x.pandigital? && x.prime?
end

# TODO: still a bit slow, start search in reverse and return immediately upon first found value
puts "#{pandigitals.max}"

# =>  7652413
