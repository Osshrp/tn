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
      @occupied_volume += volume
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
      raise puts "wagon valume must bo from 60 to 256" if @volume < 60 || @volume > 256
      true
    end
  end
end
