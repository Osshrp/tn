module RailWay
  module Accessors
    def my_attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          if instance_variable_define?("#{var_name}_hist".to_sym)
            current_value = instance_variable_get("#{var_name}_hist".to_sym)
            instance_variable_set("#{var_name}_hist".to_sym, current_value << value)
          else
            instance_variable_set("#{var_name}_hist".to_sym, value)
          end
        end
      end
    end
  end
end
