module RailWay
  class Station
    attr_reader :name

    def initialize(name)
      @name = name
      @trains = []
    end

    def arrive(train)
      @trains << train
    end

    def departure(train)
      @trains.delete(train)
    end

    def trains_list(type=nil)
      type.nil? ? @trains : @trains.select { |train| train.type == type }
    end
  end
end
