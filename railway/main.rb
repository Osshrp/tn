require_relative 'station'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'

def create_station
  puts "Введите название станции"
  station_name = gets.chomp
  @stations << RailWay::Station.new(station_name)
end

def create_cargo_train(number)
  @trains << RailWay::CargoTrain.new(number)
end

def create_passenger_train(number)
  @trains << RailWay::PassengerTrain.new(number)
end

def new_train(type, number)
  type == :cargo ? create_cargo_train(number) : create_passenger_train(number)
end

def select_train(number)
  @trains.select { |train| train.number == number }
end

def select_station(name)
  @stations.select { |station| station.name == name }
end

def create_train
  puts "Введите номер поезда"
  train_number = gets.chomp

  train_type = { 1 => :passenger, 2 => :cargo }
  puts "Выберите тип поезда"
  puts "1: пассажирский"
  puts "2: грузовой"
  input = gets.chomp.to_i
  new_train(train_type[input], train_number) if train_type.has_key?(input)
end

def stations_list
  @stations.each { |station| puts station.name }
end

def trains_list
  @trains.each do |train|
    puts "Поезд №: #{train.number}, тип: #{train.type}, количество вагонов: #{train.wagons.size}"
  end
end

def get_train_number
  trains_list
  puts "Введите номер поезда"
  gets.chomp
end

def get_station_name
  stations_list
  puts "Введите название станции"
  gets.chomp
end

def attach_wagon
  select_train(get_train_number)[0].attach_wagon
end

def detach_wagon
  select_train(get_train_number)[0].detach_wagon
end

def train_to_station
  train_number = get_train_number
  station_name = get_station_name
  select_station(station_name)[0].arrive(select_train(train_number)[0])
end

def trains_on_station
  select_station(get_station_name)[0].trains_list.each do |train|
    puts "Номер поезда: #{train.number}, тип поезда: #{train.type}"
  end
end

@stations = []
@trains = []

main_menu = {
              1 => :create_station,
              2 => :create_train,
              3 => :attach_wagon,
              4 => :detach_wagon,
              5 => :train_to_station,
              6 => :trains_on_station,
              8 => :stations_list,
              9 => :trains_list,
              0 => :exit
            }

loop do
  puts "1: создать станцию"
  puts "2: создать поезд"
  puts "3: прицепить вагон к поезду"
  puts "4: отцепить выган от поезда"
  puts "5: поместить поезд на станцию"
  puts "6: список поездов на станции"
  puts "8: список станций"
  puts "9: список поездов"
  puts "0: выход"

  input = gets.chomp.to_i
  send(main_menu[input]) if main_menu.has_key?(input)
end
