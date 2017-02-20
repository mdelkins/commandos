module Commando
  class FakeCommandRegistry < IAmACommandRegistry
    def initialize
      register FakeCommand, handler: FakeHandler.new
    end
  end
end
