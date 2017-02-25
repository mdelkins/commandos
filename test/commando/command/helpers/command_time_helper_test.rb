require 'test_helper'

module Commandoes
  class IAmACommandTest < Minitest::Test
    class WhenUsingTimeHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        values do
          time :time
        end
      end

      def subject
        FakeCommand
      end
      
      class AndValueIsCastableToTime < WhenUsingTimeHelper
        def sut
          @sut ||= subject.new time: "2010-01-04 05:00:14 PM"
        end

        def test_value_is_a_time
          assert_kind_of Time, sut.time
          assert_equal   Time.parse("2010-01-04 05:00:14 PM"), sut.time
        end
      end

      class AndValueIsNotCastableToTime < WhenUsingTimeHelper
        def sut
          @sut ||= subject.new time: :abc
        end

        def test_value_is_not_a_time
          refute_kind_of Time, sut.time
          assert_equal   :abc, sut.time
        end
      end
    end
  end
end
