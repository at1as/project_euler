# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used? 

# DO NOT COUNT Spaces, or hypens

ONES = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  0 => ""
}
TEENS = {
  0 => "ten",
  1 => "eleven",
  2 => "twelve",
  3 => "thirteen",
  4 => "forteen",
  5 => "fifteen",
  6 => "sixteen",
  7 => "seventeen",
  8 => "eighteen",
  9 => "nineteen"  
}
TENS = {
  2 => "twenty",
  3 => "thirty",
  4 => "forty",
  5 => "fifty",
  6 => "sixty",
  7 => "seventy",
  8 => "eighty",
  9 => "ninety"
}
 

res = (1..1000).map do |num|
  digits = num.to_s.reverse.split("").map(&:to_i)
  
  words = []

  # Count the 'ones' digit, unless between 11 and 19
  if digits.length > 0 && !(digits.length > 1 && digits[1] == 1)
    words << ONES[digits[0]]
  end
 
  # Count the 'tens' digit. Handle case for 11 - 19 and standard case
  if digits.length > 1
    if digits[1] == 1
      words << TEENS[digits[0]]
    else
      words << TENS[digits[1]]
    end
  end
  
  # Count the 'hundreds' digit. Add 'and' to hundred unless number is divisible by 100
  if digits.length > 2
    if digits[2] != 0
      if digits[0..1] != [0, 0]
        words << (ONES[digits[2]] + "hundred and")
      else
        words << (ONES[digits[2]] + "hundred")
      end
    end
  end
 
  # Cound the 'thousands' digit. We stop here, so this is only built for the base '1000' case
  if digits.length == 4 
    words << (ONES[digits[3]] + "Thousand")
  end

  words.reject(&:nil?).map { |w| w.gsub(' ', '').length }.sum
end

puts "#{res.sum}"

# TODO:
#   another solution online showed 21124 (off by 10). Need to investigate
# => 21114

