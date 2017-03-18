require_relative 'station'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'

module RailWay
  class Main

    def initialize
      @stations = []
      @trains = []
    end

    def run
      main_menu = {
                    1 => :create_station,
                    2 => :create_train,
                    3 => :attach_wagon,
                    4 => :detach_wagon,
                    5 => :train_to_station,
                    6 => :trains_on_station,
                    8 => :stations_list,
                    9 => :trains_list,
                    10 => :wagons_list,
                    11 => :book_place,
                    0 => :exit
                  }

      loop do
        puts "1:  создать станцию"
        puts "2:  создать поезд"
        puts "3:  прицепить вагон к поезду"
        puts "4:  отцепить выган от поезда"
        puts "5:  поместить поезд на станцию"
        puts "6:  список поездов на станции"
        puts "8:  список станций"
        puts "9:  список поездов"
        puts "10: список вагонов поезда"
        puts "11: забронировать место"
        puts "0: выход"

        input = gets.chomp.to_i
        send(main_menu[input]) if main_menu.has_key?(input)
      end
    end

    private

    def create_station
      puts "Введите название станции"
      station_name = gets.chomp
      @stations << RailWay::Station.new(station_name)
    rescue StandardError => e
      puts "#{e.message}"
      create_station
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
    rescue StandardError => e
      puts "#{e.message}"
      create_train
    end

    def attach_wagon
      train = select_train(get_train_number)[0]
      if train.type == :cargo
        puts "Введите объем вагона(60 - 256 м3):"
        volume = gets.chomp.to_f
        wagon = RailWay::CargoWagon.new(volume)
      else
        puts "Введите вместимость вагона(40 - 80 мест):"
        seats = gets.chomp.to_i
        wagon = RailWay::PassengerWagon.new(seats)
      end
      train.attach_wagon(wagon)
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
      # select_station(get_station_name)[0].trains_list.each do |train|
      #   puts "Номер поезда: #{train.number}, тип поезда: #{train.type}"
      # end
      select_station(get_station_name)[0].each_train do |train|
        string = <<~END.gsub(/\n/,'')
        Номер поезда: #{train.number},
         тип поезда: #{train.type},
         количество вагонов: #{train.wagons.size}
        END
        puts string
      end
    end

    def stations_list
      @stations.each { |station| puts station.name }
    end

    def trains_list
      @trains.each do |train|
        puts "Поезд №: #{train.number}, тип: #{train.type}, количество вагонов: #{train.wagons.size}"
      end
    end

    def wagons_list
      select_train(get_train_number)[0].each_wagon do |wagon|
        i = 1
        if wagon.type == :cargo
          string = <<~END.gsub(/\n/,'')
          №#{i}, Тип: #{wagon.type},
           свободный объем: #{wagon.free_volume},
           занятый объем: #{wagon.occupied_volume}
          END
          puts string
        else
          string = <<~END.gsub(/\n/,'')
          №#{i}, Тип: #{wagon.type},
           свободные места: #{wagon.free_seats},
           занятые места: #{wagon.occupied_seats}
          END
          puts string
        end
        i += 1
      end
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

    def get_train_number
      trains_list
      puts "Введите номер поезда"
      train_number = gets.chomp
      raise "Такого поезда нет" unless select_train(train_number)[0]
      train_number
     rescue StandardError => e
       puts "#{e.message}"
       get_train_number
    end

    def get_station_name
      stations_list
      puts "Введите название станции"
      name = gets.chomp
      raise "Такой станции нет" unless select_station(name)[0]
      name
    rescue StandardError => e
      puts "#{e.message}"
      get_station_name
    end
  end
end

app = RailWay::Main.new
app.run
