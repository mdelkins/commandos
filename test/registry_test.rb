require 'test_helper'

module Commandoes
  class IAmACommandRegistryTest < Minitest::Test
    def subject
      FakeCommandRegistry
    end

    def sut
      @sut ||= subject.new
    end

    class WhenHandlerForCommandFoundInRegistry < IAmACommandRegistryTest
      def test_correct_handler_returned
        assert_equal FakeHandler, sut[FakeCommand]
        assert_equal FakeHandler, sut[FakeCommand.new]
      end
    end

    class WhenHandlerForCommandNotFoundInRegistry < IAmACommandRegistryTest
      def test_null_handler_returned
        assert_equal NullHandler, sut[:foo]
      end
    end
  end
end
