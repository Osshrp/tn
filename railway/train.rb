module RailWay
  class Train
    attr_accessor :speed, :route
    attr_reader :wagons_quantity, :type, :number, :current_station

    def initialize(speed = 0, number, wagons_quantity, type, route)
      @speed = speed
      @number = number
      @type = type
      @wagons_quantity = wagons_quantity
      @route = route
      @current_station = route.stations.first
      @current_station.arrive(self)
      @count = 0
    end

    def go
      @speed = 60
      @current_station.departure(self)
      @count += 1
      @current_station = route.stations[@count]
      @current_station.arrive(self)
      stop
    end

    def stop
      @speed = 0
    end

    def attach_wagon
      puts "Attaching wagon"
      @wagons_quantity += 1 if speed == 0
    end

    def detach_wagon
      puts "Detaching wagon"
      @wagons_quantity -= 1 if speed == 0
    end

    def next_station
      if @count == route.stations.size
        @current_station.name
      else
        route.stations[@count+1].name
      end
    end

    def previous_station
      if @count == 0
        @current_station.name
      else
        route.stations[@count-1].name
      end
    end
  end
end
