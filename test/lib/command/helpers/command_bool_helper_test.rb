require 'test_helper'

module Commando
  class IAmACommandTest < Minitest::Test
    class WhenUsingBoolHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        values do
          bool :bool
        end
      end

      def subject
        FakeCommand
      end

      class AndValueIsTruthy < WhenUsingBoolHelper
        def test_value_is_true
          assert_equal true, subject.new(bool: true).bool
          assert_equal true, subject.new(bool: "true").bool
          assert_equal true, subject.new(bool: "1").bool
        end
      end

      class AndValueIsFalsey < WhenUsingBoolHelper
        def test_value_is_false
          assert_equal false, subject.new(bool: false).bool
          assert_equal false, subject.new(bool: "false").bool
          assert_equal false, subject.new(bool: "0").bool
        end
      end

      class AndValueIsNotTruthyOrFalsey < WhenUsingBoolHelper
        def sut
          @sut ||= subject.new bool: :abc
        end

        def test_value_is_not_true_or_false
          refute_equal true,  sut.bool
          refute_equal false, sut.bool
          assert_equal :abc,  sut.bool
        end
      end
    end
  end
end
