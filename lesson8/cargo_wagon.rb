require_relative 'wagon'

module RailWay
  class CargoWagon < Wagon

    attr_reader :occupied_volume

    def initialize(volume)
      @volume = volume
      validate!
      @occupied_volume = 0
    end

    def type
      :cargo
    end

    def take_a_place(volume)
      @occupied_volume += volume unless free_volume.zero?
    end

    def free_volume
      @volume - @occupied_volume
    end

    def valid?
      validate!
    rescue
      false
    end

    private

    def validate!
      raise puts "wagon valume must bo from 60 to 256" unless @volume.between?(60,256)
      true
    end
  end
end
