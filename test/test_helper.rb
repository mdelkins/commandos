$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'commandos'

require_relative './fixtures/fake_command'
require_relative './fixtures/fake_handler'
require_relative './fixtures/fake_plugin'
require_relative './fixtures/fake_registry'

require 'minitest/color'
require 'minitest/autorun'


