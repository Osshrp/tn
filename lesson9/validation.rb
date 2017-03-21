module RailWay
  module Validation
    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      attr_reader :validations

      def validate(name, attrs)
        @validations ||= {}
        @validations[name] ||= []
        @validations[name] << attrs
      end
    end

    module InstanceMethods
      def validate!
        validations = self.class.validations

        validations.each do |var_name, validations_arr|
          var_value = instance_variable_get("@#{var_name}")
          validations_arr.each do |validation_hash|
            validation_hash.each do |method, validation|
              send(method.to_sym, var_value, validation)
            end
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

      def presence(variable, *)
        raise 'argument could not be nil or empty' if !variable || variable.empty?
      end

      def var_type(variable, klass)
        unless variable.is_a?(klass)
          raise "#{variable} is not belong to #{klass} class"
        end
      end

      def format(variable, expression)
        raise "#{variable} does not match format" if variable !~ expression
      end
    end
  end
end
