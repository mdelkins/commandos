module Commando
  class PluginTest < Minitest::Test
    def subject
      Plugins::FakePlugin
    end

    class WhenUsingAPlugin < PluginTest
      def setup
        FakeCommand.use subject
      end

      class AndPluginHasInstanceBehavior < WhenUsingAPlugin
        def sut
          @sut ||= FakeCommand.new
        end

         def test_behavior_acquired
           assert sut.new_instance_behavior?
         end
      end

      class AndPluginHasClassBehavior < WhenUsingAPlugin
        def sut
          @sut ||= FakeCommand
        end

        def test_behavior_acquired
          assert sut.new_class_behavior?
        end
      end
    end
  end
end
