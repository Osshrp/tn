array = 100.times.each_with_object([0,1]) { |num, arr| arr << arr[-2] + arr[-1] }
puts array
