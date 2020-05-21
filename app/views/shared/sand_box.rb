array = [1, 2, 3]

i = "a test message"
puts i                     # a test message

array.each do |value; i, j|
  i, j = value, value * 2  # 1  2
  puts "#{i}  #{j}"        # 2  4
end                        # 3  6

puts i