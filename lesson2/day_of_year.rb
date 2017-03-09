puts "Введите год"
year = gets.chomp.to_i
puts "Введите месяц"
month = gets.chomp.to_i
puts "Введите день"
day = gets.chomp.to_i

days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
days_in_months[1] = 29 if year%4 == 0 && year%100 != 0 || year%400 == 0

days = 0

if month == 1
  days = day
else
  0.upto(month - 2) { |i| days += days_in_months[i] }
  days += day
end

puts "На дату #{day}.#{month}.#{year} прошло #{days} дней с начала года"
