puts "Введите ваше имя"
name = gets.chomp
puts "Введите ваш рост"
height = gets.chomp
ideal_weight = height.to_i - 110

if ideal_weight < 0
  puts "#{name}, ваш вес уже идеальный"
else
  puts "#{name}, ваш идеальный вес: #{ideal_weight} кг"
end
