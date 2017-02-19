require 'test_helper'

class CommandoTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Commando::VERSION
  end
end
