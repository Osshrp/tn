require_relative 'cargo_wagon'
require_relative 'train'
require_relative 'validation'

module RailWay
  class CargoTrain < Train
    include Validation

    validate :number, :format => /^[А-Яа-я0-9]{3}-?[А-Яа-я0-9]{2}$/, :var_type => String

    def type
      :cargo
    end
  end
end
