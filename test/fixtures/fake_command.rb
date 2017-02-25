module Commandoes
  class FakeCommand < IAmACommand
    values do
      string :foo
      string :bar
    end

    validates_presence_of \
      :foo
  end
end
