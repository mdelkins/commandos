module Commandos
  class FakeHandler
    def initialize(command)
      @command = command
    end

    def call
      true
    end

  private
    attr_reader :command
  end
end
