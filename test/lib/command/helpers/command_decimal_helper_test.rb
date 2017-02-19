require 'test_helper'

module Commando
  class IAmACommandTest < Minitest::Test
    class WhenUsingDecimalHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        values do
          decimal :decimal
        end
      end

      def subject
        FakeCommand
      end
      
      class AndValueIsADecimal < WhenUsingDecimalHelper
        def sut
          @sut ||= subject.new decimal: "143.123"
        end

        def test_value_is_a_decimal
          assert_kind_of BigDecimal, sut.decimal
          assert_equal   BigDecimal('143.123'), sut.decimal
        end
      end

      class AndValueIsNotADecimal < WhenUsingDecimalHelper
        def sut
          @sut ||= subject.new decimal: :abc
        end

        def test_value_is_not_a_decimal
          refute_kind_of BigDecimal, sut.decimal
          assert_equal   :abc,       sut.decimal
        end
      end
    end
  end
end
