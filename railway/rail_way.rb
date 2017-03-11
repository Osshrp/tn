require_relative 'station'
require_relative 'train'
require_relative 'route'

route = RailWay::Route.new([RailWay::Station.new("Moscow"),RailWay::Station.new("Piter")])
route.add_station(RailWay::Station.new("Петушки"))
train = RailWay::Train.new("23", 10, :passenger)
train.take_route(route)
puts "Количество вагонов: #{train.wagons_quantity}"
train.attach_wagon
puts "Количество вагонов: #{train.wagons_quantity}"
train.detach_wagon
puts "Количество вагонов: #{train.wagons_quantity}"
puts "Текущая станция: #{train.current_station.name}"
train.go
puts "Текущая станция: #{train.current_station.name}"
puts "Следующая станция: #{train.next_station}"
puts "Предыдующая станция: #{train.next_station}"
# station = RailWay::Station.new("Казань")
