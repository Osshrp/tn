module RailWay
  module Validation
    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      def validate(name, attrs)
        @validations ||= {}
        @validations[name] = attrs
      end
    end

    module InstanceMethods
      def validate!
        validations = self.class.instance_variable_get(:@validations)

        validations.each do |var_name, validations_hash|
          @instance_var = instance_variable_get("@#{var_name}")
          validations_hash.each do |method, validation|
            send(method.to_sym, validation)
          end
        end
      end

      def valid?
        validate!
        true
      rescue
        false
      end

      private

      def presence(*)
        raise 'argument could not be nil or empty' if !@instance_var || @instance_var.empty?
      end

      def var_type(klass)
        unless @instance_var.is_a?(klass)
          raise "#{@instance_var} is not belong to #{klass} class"
        end
      end

      def format(expression)
        raise "#{@instance_var} does not match format" if @instance_var !~ expression
      end
    end
  end
end
