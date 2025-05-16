# Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными
# arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# evens = arr.select.with_index { |_, index| index.even? }
# odds = arr.select.with_index { |_, index| index.odd? }
# result = evens + odds
# puts result.inspect # => [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]

# require 'bigdecimal'

# puts num = 222**59
# puts num.class

# num = Rational(2, 3)
# puts num.class

# a = BigDecimal("0.1")
# puts a

# a = 0.1 + 0.2
# b = 0.3
# epsilon = 1e-10 # 0.0000000001
# puts (a - b).abs < epsilon

# # require 'complex'
# puts c = Complex(2, 3)         #=> 2+3i
# puts c.real                    #=> 2
# puts c.imag                    #=> 3

# puts -3.negative?
# puts 5.fdiv(2)
# puts 4/5

# puts 5.to_f        # => 5.0
# puts 5.3.to_i      # => 5
# puts 5.to_r        # => Rational(5, 1)
# puts 5.to_c        # => Complex(5, 0)
# puts "5".to_i      # => 5

puts 7.clamp(3, 5)
