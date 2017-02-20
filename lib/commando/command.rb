module Commando
  class IAmACommand
    include Virtus.value_object
    include ActiveModel::Validations

    def valid?
      @valid ||= super
    end

    def self.bool(value, options={})
      attribute value, Axiom::Types::Boolean, options
    end

    def self.date(value, options={})
      attribute value, Date, options
    end

    def self.datetime(value, options={})
      attribute value, DateTime, options
    end

    def self.decimal(value, options={})
      attribute value, BigDecimal, options
    end

    def self.float(value, options={})
      attribute value, Float, options
    end

    def self.integer(value, options={})
      attribute value, Integer, options
    end

    def self.string(value, options={})
      attribute value, String, options
    end

    def self.time(value, options={})
      attribute value, Time, options
    end
  end
end
