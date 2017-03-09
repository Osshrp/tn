arr = [0, 1]
while arr[-1] + arr[-2] < 100
  arr << arr[-2] + arr[-1]
end
puts arr
