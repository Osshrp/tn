module RailWay
  class Route

    attr_reader :stations

    def initialize(first_station, last_station)
      @stations = [first_station, last_station]
      validate!
    end

    def add_station(station)
      @stations.insert(-2, station)
    end

    def delete_station(station)
      @stations.delete(station)
    end

    def valid?
      validate!
    rescue
      false
    end

    private

    def validate!
      if @stations.first.class.is_a?(RailWay::Station)
        raise "#{@stations.first} is not an object of class RailWay::Station"
      elsif @stations.last.class.is_a?(RailWay::Station)
        raise "#{@stations.last} is not an object of class RailWay::Station"
      end
      true
    end
  end
end
