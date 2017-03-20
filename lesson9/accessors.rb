module RailWay
  module Accessors
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        values = []
        define_method(name.to_sym) { instance_variable_get(var_name) }

        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          instance_variable_set("#{var_name}_hist".to_sym, values << value)
        end

        define_method("#{name}_history".to_sym) do
          instance_variable_get("#{var_name}_hist".to_sym)
        end
      end
    end

    def strong_attr_accessor(attrs_hash)
      attrs_hash.each do |name, klass|
        define_method(name.to_sym) { instance_variable_get("@#{name}".to_sym) }

        define_method("#{name}=".to_sym) do |value|
          if value.is_a?(klass)
            instance_variable_set("@#{name}".to_sym, value)
          else
            raise "Type mismatch, @#{name} should belong #{klass} class"
          end
        end
      end
    end
  end
end
