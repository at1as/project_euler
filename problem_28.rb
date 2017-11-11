# Problem 28 - Number spiral diagonals
# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

SIZE = 1001
matrix = Array.new(SIZE) { Array.new(SIZE) }

spiral_size = 1
x = SIZE / 2
y = SIZE / 2

num = 1
total = []

matrix[x][y] = 1

loop do
  begin

    # +x (RIGHT) direction
    (1..spiral_size).each do |offset|
      num += 1
      matrix[y][x + offset] = num if x + offset < SIZE
    end
    x += spiral_size
    total << matrix[y][x - 1]
    
    # +y (DOWN) direction
    (1..spiral_size).each do |offset|
      num +=1
      matrix[y + offset][x] = num if y + offset < SIZE
    end
    y += spiral_size
    total << matrix[y][x]

    spiral_size += 1

    # -x (LEFT) direction
    (1..spiral_size).each do |offset|
      num += 1
      matrix[y][x - offset] = num if x - offset > -1
    end
    x -= spiral_size
    total << matrix[y][x]

    # -y (UP) direction
    (1..spiral_size).each do |offset|
      num += 1
      matrix[y - offset][x] = num if y - offset > -1
    end
    y -= spiral_size
    total << matrix[y][x]
    
    spiral_size += 1

  rescue NoMethodError => e
    # this will always throw once the matrix has been populated
    # when the +y (DOWN) direction tries to create a cell in an out of bounds rows
    puts total.reduce(:+)
    break
  end
end

# => 669171001

