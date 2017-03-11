module RailWay
  class Train
    attr_accessor :speed
    attr_reader :wagons_quantity, :type, :number, :route

    def initialize(number, wagons_quantity, type)
      @speed = 0
      @number = number
      @type = type
      @wagons_quantity = wagons_quantity
      @stations_counter = 0
    end

    def take_route(route)
      @route = route
      arrive_to_station
    end

    def increase_speed
      @self.speed += 10
    end

    def go
      self.speed = 60
      route.stations[@stations_counter].departure(self)
      @stations_counter += 1
      arrive_to_station
      stop
    end

    def stop
      self.speed = 0
    end

    def attach_wagon
      return unless self.speed.zero?

      puts "Attaching wagon"
      @wagons_quantity += 1
    end

    def detach_wagon
      return unless self.speed.zero?

      puts "Detaching wagon"
      @wagons_quantity -= 1
    end

    def arrive_to_station
      route.stations[@stations_counter].arrive(self)
    end

    def current_station
      route.stations[@stations_counter]
    end

    def next_station
      if @stations_counter + 1 == self.route.stations.size
        puts "Это конечная станция"
        route.stations[@stations_counter].name
      else
        route.stations[@stations_counter + 1].name
      end
    end

    def previous_station
      if @stations_counter == 0
        puts "Это первая станция маршрута"
        route.stations[@stations_counter].name
      else
        route.stations[@stations_counter - 1].name
      end
    end
  end
end
