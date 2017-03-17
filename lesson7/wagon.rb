require_relative 'manufacturer'
require_relative 'instance_counter'

module RailWay
  class Wagon
    include Manufacturer
    include InstanceCounter

    def initialize
      register_instance
    end
  end
end
