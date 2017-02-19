module Commando
  class IAmACommand
    include Virtus.value_object

    def self.bool(value, options={})
      attribute value, Axiom::Types::Boolean, options
    end

    def self.date(value, options={})
      attribute value, Date, options
    end

    def self.datetime(value, options={})
      attribute value, DateTime, options
    end
  end
end
