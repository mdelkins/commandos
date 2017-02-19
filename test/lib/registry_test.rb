require 'test_helper'

module Commando
  class IAmACommandRegistryTest < Minitest::Test
    class WhenHandlerForCommandFoundInRegistry < IAmACommandRegistryTest
      def subject
        FakeCommandRegistry
      end

      def sut
        @sut ||= subject.new
      end
      
      def test_correct_handler_returned
        assert_kind_of FakeHandler, sut[FakeCommand]
        assert_kind_of FakeHandler, sut[FakeCommand.new]
      end

      class FakeCommandRegistry < IAmACommandRegistry
        def initialize
          register FakeCommand, handler: FakeHandler.new
        end
      end
    end
  end

  class FakeCommand < IAmACommand
    values do
      integer :foo
      string  :bar
    end
  end

  class FakeHandler
    def call(command) 
    end
  end
end
