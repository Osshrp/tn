arr = [0, 1]
i = 1
while arr[i] < 100
  arr << arr[-2] + arr[-1]
  i += 1
end
arr.pop
puts arr
