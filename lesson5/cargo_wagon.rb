require_relative 'wagon'

module RailWay
  class CargoWagon < Wagon
    def type
      :cargo
    end
  end
end
