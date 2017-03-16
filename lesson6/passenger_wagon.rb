require_relative 'wagon'

module RailWay
  class PassengerWagon < Wagon
    def type
      :passenger
    end
  end
end
