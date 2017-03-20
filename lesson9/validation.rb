module RailWay
  module Validation

    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      # attr_accessor :var_name, :validations

      def validate(name, attrs)
        # @name = name
        puts "11 #{name}, 22 #{attrs[:format]}"
        instance_variable_set(:@var_name, name.to_sym)
        puts "++++++++++#{instance_variable_get(:@var_name)}"
        # @validations = attrs
        instance_variable_set(:@validations, attrs)
        puts "==========#{instance_variable_get(:@validations)}"
      end

    end

    module InstanceMethods
      def validate!

        @name = self.class.instance_variable_get(:@var_name)
        validations = self.class.instance_variable_get(:@validations)

        puts "name= #{@var_name}, val= #{validations}"
        # if validations == :presence
        #   presence
        # else
        #   validations.each do |method, validation|
        #     send(method.to_sym, validation)
        #   end
        # end
      end

      def presence
        raise "argument could not be nil or empty" if !@name || @name.empty?
      end

      def type(klass)
        raise "#{@name} is not belong to #{klass} class" unless @name.is_a?(klass)
      end

      def format(expression)
        raise "#{@name} does not match format" if @name !~ expression
      end
    end
  end
end
