module Commandoes
  UnknownCommand   = Class.new StandardError
  RegistryNotFound = Class.new StandardError

  class Dispatcher
    def initialize(registry: nil)
      @registry = registry
    end

    def dispatch(command)
      raise RegistryNotFound unless registry.present?
      raise UnknownCommand   unless command.kind_of? IAmACommand

      registry.find_by command do |handler|
        handler = handler.new command
        result  = handler.call

        if block_given?
          yield result
        end
        
        return result
      end
    end

  private
    attr_reader :registry
  end
end
