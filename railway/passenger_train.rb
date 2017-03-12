require_relative 'passenger_wagon'
require_relative 'train'

module RailWay
  class PassengerTrain < Train
    def type
      :passenger
    end

    def attach_wagon
      super
      wagons << PassengerWagon.new
    end

    def detach_wagon
      super
      wagons.pop
    end
  end
end
