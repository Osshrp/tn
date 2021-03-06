require_relative 'validation'

module RailWay
  class Station
    include Validation

    validate :name, presence: true, format: /^[A-Za-z]{3,}|^[А-Яа-я]{3,}$/

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

    def trains_list(type = nil)
      type ? @trains.select(&:type) : @trains
    end

    def each_train
      @trains.each { |train| yield(train) }
    end
  end
end
