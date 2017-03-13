require_relative 'cargo_wagon'
require_relative 'train'

module RailWay
  class CargoTrain < Train
    def type
      :cargo
    end
  end
end
