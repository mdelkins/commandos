require 'test_helper'

module Commandoes
  class IAmACommandTest < Minitest::Test
    class WhenUsingIntegerHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        values do
          integer :integer
        end
      end

      def subject
        FakeCommand
      end
      
      class WhenValueIsCastableToAnInteger < WhenUsingIntegerHelper
        def sut
          @sut ||= subject.new integer: "143.123"
        end

        def test_value_is_a_number
          assert_kind_of Integer, sut.integer
          assert_equal   143,     sut.integer
        end
      end

      class WhenValueIsNotCastableToAnInteger < WhenUsingIntegerHelper
        def sut
          @sut ||= subject.new integer: :abc
        end

        def test_value_is_not_a_number
          refute_kind_of Integer, sut.integer
          assert_equal   :abc,  sut.integer
        end
      end
    end
  end
end
