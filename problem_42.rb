# Problem 42: Coded Triangle Numbers
#
# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
#
# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

def triangle(n)
  (1.to_f/2) * n * (n + 1)
end

f = File.read("p042_words.txt").split(",").map(&:strip).map {|x| x.delete('"') }

triangular_words = 0
f.each do |word|
  word_value = word.split("").map { |c| ('A'..'Z').zip((1..26)).to_h[c.upcase] }.reduce(:+)

  triangular_words += 1 if (1..100).map { |x| triangle(x) }.any? {|x| x == word_value }
end

puts triangular_words

# => 162

