sides = []
puts "Введите длины сторон треугольника"
3.times do |i|
  puts "Сторона #{i+1}:"
  sides << gets.chomp.to_f
end

sides_min = sides.min(2)

if sides.max ** 2 == sides_min[0] ** 2 + sides_min[1] ** 2
  puts "Треугольник является прямоугольным"
  if sides_min[0] == sides_min[1]
    puts "и равнобедренным"
  end
else
  puts "Треугольник не является прямоугольным"
  if sides.uniq.length == 1
    puts "но является равносторонним"
  elsif sides.uniq.length == 2
    puts "но является равнобедренным"
  end
end
