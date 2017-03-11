module RailWay
  class Train
    attr_accessor :speed
    attr_reader :wagons_quantity, :type, :number, :route

    def initialize(number, wagons_quantity, type)
      @speed = 0
      @number = number
      @type = type
      @wagons_quantity = wagons_quantity
      @stations_count = 0
    end

    def take_route(route)
      @route = route
      arrive_to_station
    end

    def increase_speed
      @speed += 10
    end

    def go
      @speed = 60
      self.route.stations.first.departure(self)
      @stations_count += 1
      arrive_to_station
      stop
    end

    def stop
      self.speed = 0
    end

    def attach_wagon
      if self.speed.zero?
        puts "Attaching wagon"
        @wagons_quantity += 1
      end
    end

    def detach_wagon
      if self.speed.zero?
        puts "Detaching wagon"
        @wagons_quantity -= 1
      end
    end

    def arrive_to_station
      self.route.stations[@stations_count].arrive(self)
    end

    def current_station
      self.route.stations[@stations_count]
    end

    def next_station
      if @stations_count + 1 == self.route.stations.size
        puts "Это конечная станция"
        self.route.stations[@stations_count].name
      else
        self.route.stations[@stations_count + 1].name
      end
    end

    def previous_station
      if @stations_count == 0
        puts "Это первая станция маршрута"
        self.route.stations[@stations_count].name
      else
        self.route.stations[@stations_count - 1].name
      end
    end
  end
end
