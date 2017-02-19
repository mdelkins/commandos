require 'test_helper'

module Commando
  class IAmACommandTest < Minitest::Test
    class WhenUsingDateHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        values do
          date :date
        end
      end

      def subject
        FakeCommand
      end
      
      class WhenValueIsADate < WhenUsingDateHelper
        def sut
          @sut ||= subject.new date: "2010-01-04 05:00:14 PM"
        end

        def test_value_is_a_date
          assert_kind_of Date, sut.date
          assert_equal   Date.parse("2010-01-04"), sut.date
        end
      end

      class WhenValueIsNotADate < WhenUsingDateHelper
        def sut
          @sut ||= subject.new date: :abc
        end

        def test_value_is_not_a_date
          refute_kind_of Date, sut.date
          assert_equal   :abc, sut.date
        end
      end
    end
  end
end
