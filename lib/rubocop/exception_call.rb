require 'rubocop'
require "rubocop/exception_call/version"
require 'rubocop/exception_call/inject'

RuboCop::ExceptionCall::Inject.defaults!

# cops
require 'rubocop/cop/lint/exception_call'
