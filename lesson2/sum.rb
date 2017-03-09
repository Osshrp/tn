sum = 0
goods = {}
loop do
  puts 'Введите название товара или "стоп" если хотите закончить ввод'
  name = gets.chomp
  break if name == "стоп"
  puts "Цена товара"
  price = gets.chomp.to_i
  puts "Количество"
  quantity = gets.chomp.to_f
  goods[name] = {
    "Цена" => price, "Количество" => quantity, "Сумма" => price * quantity
  }
  sum += goods[name]["Сумма"]
end
p goods
p "Сумма всех товаров в корзине: #{sum}"
