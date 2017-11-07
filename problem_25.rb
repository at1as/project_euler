# Problem 25: 1000-digit Fibonacci number
#
# The Fibonacci sequence is defined by the recurrence relation:
#
#    Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
#
# Hence the first 12 terms will be:
#
#    F1 = 1
#    F2 = 1
#    F3 = 2
#    F4 = 3
#    F5 = 5
#    F6 = 8
#    F7 = 13
#    F8 = 21
#    F9 = 34
#    F10 = 55
#    F11 = 89
#    F12 = 144
#
# The 12th term, F12, is the first term to contain three digits.
#
# What is the index of the first term in the Fibonacci sequence to contain 1000 digits?

def next_fib(fib_sequence)
	if fib_sequence.empty?
		[1]
	elsif fib_sequence == [1]
		[1, 1]
	else
		fib_sequence + [fib_sequence.last + fib_sequence[-2]]
	end
end

def fib_of_length(target_length)
	fib_sequence = []
	idx = 0

	while fib_sequence.last.to_s.length != target_length
		idx += 1
		fib_sequence = next_fib(fib_sequence)
	end

	idx
end

puts fib_of_length(1000)

