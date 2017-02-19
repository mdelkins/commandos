require 'test_helper'

module Commando
  class IAmACommandTest < Minitest::Test
    class WhenUsingStringHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        values do
          string :string
        end
      end

      def subject
        FakeCommand
      end

      class AndValueIsCastableToAString < WhenUsingStringHelper
        def sut
          @sut ||= subject.new string: :abc
        end

        def test_value_is_not_a_number
          assert_kind_of String, sut.string
          assert_equal   "abc",  sut.string
        end
      end
    end
  end
end
