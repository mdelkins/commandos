module Commandos
  class IAmACommandRegistry
    def initialize(storage: DefaultStorageStrategy)
      @storage = storage
    end

    def [](command)
      handlers.fetch(storage_strategy.call command) { NullHandler }.tap do |handler|
        yield handler if block_given?
      end
    end

    alias_method :find_by, :[]

  protected

    def handlers
      @handlers ||= {}
    end

    def storage_strategy
      @storage ||= DefaultStorageStrategy
    end

    def register(command, handler: nil)
      unless handler.nil?
        handlers[storage_strategy.call command] = handler
      end
    end
  end

  DefaultStorageStrategy = ->(command) do
    return command.class unless command.kind_of? Class
    command
  end

  class NullHandler
    def initialize(command)
      @command = command
    end

    def call
      puts "-" * 65
      puts " NO HANDLER REGISTERED FOR #{command.class.upcase}"
      puts "-" * 65
      puts command.inspect
    end

  private
    attr_reader :command
  end
end
