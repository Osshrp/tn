def calc_roots(arr, discriminant)
  discriminant_sqrt = Math.sqrt(discriminant)
  @x1 = (-arr[1] + discriminant_sqrt)/2 * arr[0]
  @x2 = (-arr[1] - discriminant_sqrt)/2 * arr[0]
end

def output(string, discriminant)
  puts "Дискриминант: #{discriminant}"
  puts string
end

arr = ["a", "b", "c"]
puts "Введите коэффициенты уравнения (a,b,c)"
3.times do |i|
  puts "#{arr[i]}:"
  arr[i] = gets.chomp.to_f
end

discriminant = arr[1]**2 - 4 * arr[0] * arr[2]

if discriminant < 0
  string = "Уравнение не имеет корней"
  output(string, discriminant)
elsif discriminant == 0
  calc_roots(arr, discriminant)
  root = "X1 = #{@x1}"
  output(root, discriminant)
else
  calc_roots(arr, discriminant)
  roots = "X1 = #{@x1}, X2 = #{@x2}"
  output(roots, discriminant)
end
