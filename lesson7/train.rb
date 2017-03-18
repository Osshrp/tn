require_relative 'manufacturer'
require_relative 'instance_counter'

module RailWay
  class Train
    include Manufacturer
    include InstanceCounter

    TRAIN_NUMBER_FORMAT = /^[А-Яа-я0-9]{3}-?[А-Яа-я0-9]{2}$/

    attr_accessor :speed
    attr_reader :number, :route, :wagons

    @@trains = {}

    def self.find(number)
      # @@trains.select { |train| train.number == number }.first
      @@trains[number]
    end

    def initialize(number)
      @speed = 0
      @number = number
      validate!
      @stations_index = 0
      @wagons = []
      @@trains[number] = self
      register_instance
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

    def attach_wagon(wagon)
      if self.speed.zero? || type == wagon.type
        @wagons << wagon
      end
    end

    def detach_wagon
      return unless self.speed.zero?
      @wagons.pop
    end

    def current_station
      route.stations[@stations_index]
    end

    def next_station
      if @stations_index + 1 == self.route.stations.size
        route.stations[@stations_index].name
      else
        route.stations[@stations_index + 1].name
      end
    end

    def previous_station
      if @stations_index == 0
        route.stations[@stations_index].name
      else
        route.stations[@stations_index - 1].name
      end
    end

    def each_wagon
      @wagons.each { |wagon| yield(wagon) }
    end

    def valid?
      validate!
    rescue
      false
    end

    # метод arrive_to_station protected так как он должен неследоваться

    protected

    def arrive_to_station
      route.stations[@stations_index].arrive(self)
    end

    def validate!
      raise "Number has invalid format" if number !~ TRAIN_NUMBER_FORMAT
      true
    end
  end
end
