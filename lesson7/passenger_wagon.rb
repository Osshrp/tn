require_relative 'wagon'

module RailWay
  class PassengerWagon < Wagon

    attr_reader :occupied_seats

    def initialize(seats)
      @seats = seats
      validate!
      @occupied_seats = 0
    end

    def type
      :passenger
    end

    def take_a_seat
      @occupied_seats += 1
    end

    def free_seats
       @seats - @occupied_seats
    end

    def valid?
      validate!
    rescue
      false
    end

    private

    def validate!
      raise puts "Wagon must have from 40 to 80 seats" if @seats < 40 || @seats > 80
      true
    end
  end
end
