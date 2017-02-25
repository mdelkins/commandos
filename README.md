# COMMANDOES

Commandoes is a project designed to help any ruby app use the command pattern to
change state.

## PREREQUISITES
* ruby-2.3.1

## DEPENDENCIES
* ActiveModel::Validations

## INSTALLATION

In your Gemfile

```
gem 'commandoes'
```

## EXAMPLES

1. [Command & Handler](./examples/command_and_handler.md)
2. [Registry & Dispatcher](./examples/command_registry_and_dispatcher.md)

## PLUGINS

Commandoes uses a plugin system similar to
[sequel](https://github.com/jeremyevans/sequel) or
[roda](https://github.com/jeremyevans/roda) to extend the behavior of your
command objects.

### EXAMPLE OF A CUSTOM PLUGIN

```ruby
module Commandoes
  module Plugins
    module ExamplePlugin
      module ClassMethods
      end

      module InstanceMethods
      end
    end
  end
end
```

Any method in the `ClassMethods` module will be injected into the `IAmACommand`
class.  Any method in the `InstanceMethods` module will be injected into
instances of `IAmACommand` objects.


### Commandoes::Plugins::ActiveModelPlugin

This plugin is used to give commands active model like validation behavior.
