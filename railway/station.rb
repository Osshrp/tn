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

    def trains_list(type={})
      if type.empty?
        @trains.each { |train|  puts "Поезд: #{train.number}, тип: #{train.type[:type]}" }
      else
        @trains.each do |train|
          puts "Поезд: #{train.number}, тип: #{train.type[:type]}" if type[type] == train.type[:type]
        end
      end
    end
  end
end
