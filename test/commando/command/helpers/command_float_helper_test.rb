require 'test_helper'

module Commando
  class IAmACommandTest < Minitest::Test
    class WhenUsingFloatHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        values do
          float :float
        end
      end

      def subject
        FakeCommand
      end
      
      class AndValueIsAFloat < WhenUsingFloatHelper
        def sut
          @sut ||= subject.new float: "143.123"
        end

        def test_value_is_a_float
          assert_kind_of Float, sut.float
          assert_equal   Float('143.123'), sut.float
        end
      end

      class AndValueIsNotAFloat < WhenUsingFloatHelper
        def sut
          @sut ||= subject.new float: :abc
        end

        def test_value_is_not_a_float
          refute_kind_of Float, sut.float
          assert_equal   :abc,  sut.float
        end
      end
    end
  end
end
