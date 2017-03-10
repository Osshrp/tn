require_relative 'station'
require_relative 'train'
require_relative 'route'

route = RailWay::Route.new
route.add_station(RailWay::Station.new("Петушки"))
train = RailWay::Train.new("23", 10, { type: "passenger" }, route)
puts train.wagons_quantity
train.attach_wagon
puts train.wagons_quantity
train.detach_wagon
puts train.wagons_quantity
puts train.current_station.name
train.go
puts train.current_station.name
puts train.next_station
puts train.previous_station
# station = RailWay::Station.new("Казань")
