module RailWay
  class Route
    attr_reader :stations
    
    def initialize(stations=[
                             first_station = RailWay::Station.new("Moscow"),
                             last_station = RailWay::Station.new("Piter")
                             ])
      @stations = stations
    end

    def add_station(station)
      @stations.insert(-2, station)
    end

    def delete_station(station)
      @stations.delete(station)
    end

    def list
      @stations.each do |station|
        puts station.name
      end
    end
  end
end
