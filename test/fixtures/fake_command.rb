module Commandoes
  class FakeCommand < IAmACommand
    attr_reader :foo, :bar

    def initialize(foo: nil, bar: nil)
      @foo = foo
      @bar = bar
    end
  end
end
