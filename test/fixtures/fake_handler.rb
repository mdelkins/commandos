module Commando
  class FakeHandler
    def initialize(command)
      @command = command
    end

    def call
      return command unless command.valid?
      true
    end

  private
    attr_reader :command
  end
end
