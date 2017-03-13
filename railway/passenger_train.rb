require_relative 'passenger_wagon'
require_relative 'train'

module RailWay
  class PassengerTrain < Train
    def type
      :passenger
    end
  end
end
