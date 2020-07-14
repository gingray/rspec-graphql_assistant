require "rspec/graphql_assistant/version"
require 'active_support'
require 'active_support/core_ext'
require 'rspec/graphql_assistant/matchers'
require 'rspec/graphql_assistant/has_attrs'
require 'rspec/graphql_assistant/contain_attrs'
require 'rspec/graphql_assistant/query_builder'
require 'rspec/graphql_assistant/argument_builder'
require 'rspec/graphql_assistant/argument_builder_with_vars'
require 'rspec/graphql_assistant/helpers'

module Rspec
  module GraphqlAssistant
    class Error < StandardError; end
    # Your code goes here...
  end
end
