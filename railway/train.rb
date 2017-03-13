module RailWay
  class Train
    attr_accessor :speed
    attr_reader :number, :route, :wagons

    def initialize(number)
      @speed = 0
      @number = number
      # @type = type
      # @wagons_quantity = wagons_quantity
      @stations_index = 0
      @wagons = []
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
      route.stations[@stations_index].departure(self)
      @stations_index += 1
      arrive_to_station
      stop
    end

    def stop
      self.speed = 0
    end

    # def attach_wagon(wagon)
    #   return unless self.speed.zero?
    #   puts "Attaching wagon"
    # end

    def attach_wagon(wagon)
      unless self.speed.zero? || type == wagon.type
        return
      end
      puts "Attaching wagon"
      wagons << wagon
    end

    def detach_wagon
      return unless self.speed.zero?
      puts "Detaching wagon"
      @wagons.pop
    end

    def current_station
      route.stations[@stations_index]
    end

    def next_station
      if @stations_index + 1 == self.route.stations.size
        puts "Это конечная станция"
        route.stations[@stations_index].name
      else
        route.stations[@stations_index + 1].name
      end
    end

    def previous_station
      if @stations_index == 0
        puts "Это первая станция маршрута"
        route.stations[@stations_index].name
      else
        route.stations[@stations_index - 1].name
      end
    end

    # метод arrive_to_station protected так как он должен неследоваться

    protected

    def arrive_to_station
      route.stations[@stations_index].arrive(self)
    end
  end
end
