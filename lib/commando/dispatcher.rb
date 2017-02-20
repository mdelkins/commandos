module Commando
  UnknownCommand   = Class.new StandardError
  RegistryNotFound = Class.new StandardError

  class Dispatcher
    def initialize(registry: nil)
      @registry = registry
    end

    def dispatch(command)
      raise RegistryNotFound unless registry.present?
      raise UnknownCommand   unless command.kind_of? IAmACommand

      return response_of command, handler: registry.handler_for(command) unless block_given?
      yield response_of command, handler: registry.handler_for(command)
    end

  private
    attr_reader :registry

    def response_of(command, handler: nil)
      handler ||= NullHanler

      return command unless command.valid?
      handler.call command
    end
  end
end
