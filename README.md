# COMMANDO

Commando is a project designed to help any ruby app use the command pattern to
change state.

## PREREQUISITES
* ruby-2.3.1

## DEPENDENCIES
* Virtus (https://github.com/solnic/virtus)
* ActiveModel::Validations

## INSTALLATION

In your Gemfile

```
gem 'commando', github: 'mdelkins/commando'
```

## EXAMPLES

1. [Command & Handler](./examples/command_and_handler.md)
2. [Registry & Dispatcher](./examples/command_registry_and_dispatcher.md)

## PLUGINS

Commando uses a plugin system similar to
[sequel](https://github.com/jeremyevans/sequel) or
[roda](https://github.com/jeremyevans/roda) to extend the behavior of your
command objects.  Currently their are two dependent plugins:

* Commando::Plugins::VirtusPlugin
* Commando::Plugins::ActiveModelPlugin

### Commando::Plugins::VirtusPlugin

This plugin injects the `Virtus.value_object` behavior into
`Commando::IAmACommand` as well as a few helper methods for easily defining
typed attributes.

### Commando::Plugins::ActiveModelPlugin

This plugin is used to give commands active model like validation behavior.
