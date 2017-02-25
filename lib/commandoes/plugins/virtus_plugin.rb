module Commandoes
  module Plugins
    module VirtusPlugin

      module ClassMethods
        def self.extended(object)
          object.send(:include, Virtus.value_object)
        end

        def bool(value, options={})
          attribute value, Axiom::Types::Boolean, options
        end

        def date(value, options={})
          attribute value, Date, options
        end

        def datetime(value, options={})
          attribute value, DateTime, options
        end

        def decimal(value, options={})
          attribute value, BigDecimal, options
        end

        def float(value, options={})
          attribute value, Float, options
        end

        def integer(value, options={})
          attribute value, Integer, options
        end

        def string(value, options={})
          attribute value, String, options
        end

        def time(value, options={})
          attribute value, Time, options
        end
      end

      module InstanceMethods
      end
    end
  end
end
