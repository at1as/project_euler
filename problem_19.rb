# Problem 19
# You are given the following information, but you may prefer to do some research for yourself.
#
#    1 Jan 1900 was a Monday.
#    Thirty days has September,
#    April, June and November.
#    All the rest have thirty-one,
#    Saving February alone,
#    Which has twenty-eight, rain or shine.
#    And on leap years, twenty-nine.
#    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?


DAYS_OF_THE_WEEK = %w(monday tuesday wednesday thursday friday saturday sunday)

def leap_year?(year)
	(year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
end


def get_months(year)
  days_of_the_year = [
    31,	# JANUARY
    28, # FEBRUARY
    31, # MARCH
    30, # APRIL
    31, # MAY
    30, # JUNE
    31, # JULY
    31, # AUGUST
    30, # SEPTEMBER
    31, # OCTOBER
    30, # NOVEMBER
    31  # DECEMBER
  ]

	if leap_year?(year)
		# 29 days in february
		days_of_the_year.tap { |m| m[1] = m[1] + 1 }
	else
		days_of_the_year
	end
end


def get_days_per_year_range(start, finish)
	(start..finish).map do |year|
		get_months(year).map { |m| (1..m).to_a }
	end
end

# 1900 is included in range to acquire the correct date of the week taht 1901 starts on
# The number of sundays in 1901 are subtracted from the total afterwards

sundays_in_century  = get_days_per_year_range(1900, 2000).flatten.zip(DAYS_OF_THE_WEEK.cycle).select { |x| x == [1, "sunday"] }.count
sundays_in_1900     = get_days_per_year_range(1900, 1900).flatten.zip(DAYS_OF_THE_WEEK.cycle).select { |x| x == [1, "sunday"] }.count

puts sundays_in_century - sundays_in_1900

