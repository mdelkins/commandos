require 'test_helper'

module Commando
  class IAmACommandTest < Minitest::Test
    class WhenUsingDateTimeHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        values do
          datetime :datetime
        end
      end

      def subject
        FakeCommand
      end
      
      class AndValueIsCastableToADateTime < WhenUsingDateTimeHelper
        def sut
          @sut ||= subject.new datetime: "2010-01-04 05:00:14 PM"
        end

        def test_value_is_a_datetime
          assert_kind_of DateTime, sut.datetime
          assert_equal   DateTime.parse("2010-01-04 05:00:14 PM"), sut.datetime
        end
      end

      class AndValueIsNotCastableToADateTime < WhenUsingDateTimeHelper
        def sut
          @sut ||= subject.new datetime: :abc
        end

        def test_value_is_not_a_datetime
          refute_kind_of DateTime, sut.datetime
          assert_equal   :abc,     sut.datetime
        end
      end
    end
  end
end
