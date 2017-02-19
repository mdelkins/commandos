module Commando
  class IAmACommandRegistry
    def initialize(storage: DefaultStorageStrategy)
      @storage = storage
    end

    def [](command)
      handlers[storage_strategy.call command]
    end

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
    def call(command)
      puts "-" * 65
      puts " NO HANDLER REGISTERED FOR #{command.class.upcase}"
      puts "-" * 65
      puts command.inspect
    end
  end
end
