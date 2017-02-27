require 'test_helper'

module Commandos
  class DispatcherTest < Minitest::Test
    def subject
      Dispatcher
    end

    class WhenDispatchingCommand < DispatcherTest
      class WithoutARegistry < DispatcherTest
        def sut
          @sut ||= subject.new
        end

        def test_registry_not_found_raised
          assert_raises Commandos::RegistryNotFound do
            sut.dispatch nil
          end
        end
      end

      class WithARegistry < DispatcherTest
        def sut
          @sut ||= subject.new registry: FakeCommandRegistry.new
        end


        class AndCommandValueIsNotAKindOfIAmACommand < WithARegistry
          def test_unknown_command_raised
            assert_raises Commandos::UnknownCommand do
              sut.dispatch nil
            end
          end
        end

        class AndCommandIsValid < WithARegistry
          def command
            @command ||= FakeCommand.new foo: :abc
          end

          def test_handler_response_is_correct
            assert_equal true, sut.dispatch(command)
          end

          def test_can_dispatch_with_block
            sut.dispatch command do |response|
              assert_equal true, response
            end
          end
        end
      end
    end
  end
end
