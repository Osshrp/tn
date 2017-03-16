module RailWay
  class Route

    STATION_NAME_FORMAT = /^[A-Za-z]{3,}|^[А-Яа-я]{3,}$/

    attr_reader :stations

    def initialize(first_station, last_station)
      @stations = [first_stations, last_station]
      validat!
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
      if @stations.first !~ STATION_NAME_FORMAT && @stations.last !~ STATION_NAME_FORMAT
        raise "Station name has invalid format"
      end
      true
    end
  end
end
