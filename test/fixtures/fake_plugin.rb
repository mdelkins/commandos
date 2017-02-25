module Commandoes
  module Plugins
    module FakePlugin
      module ClassMethods
        def new_class_behavior?
          true
        end
      end

      module InstanceMethods
        def new_instance_behavior?
          true
        end
      end
    end
  end
end
