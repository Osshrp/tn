require_relative 'cargo_wagon'
require_relative 'train'

module RailWay
  class CargoTrain < Train
    def type
      :cargo
    end

    def attach_wagon
      super
      wagons << CargoWagon.new
    end

    def detach_wagon
      super
      wagons.pop
    end
  end
end
