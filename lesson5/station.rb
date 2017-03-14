module RailWay
  class Station
    attr_reader :name

    @@all = 0

    def self.all
      @@all
    end

    def initialize(name)
      @name = name
      @trains = []
      @@all += 1
    end

    def arrive(train)
      @trains << train
    end

    def departure(train)
      @trains.delete(train)
    end

    def trains_list(type=nil)
      type ? @trains.select(&:type) : @trains
    end
  end
end
