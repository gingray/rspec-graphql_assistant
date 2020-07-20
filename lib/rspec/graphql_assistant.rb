require "rspec/graphql_assistant/version"
require "rspec/core"
require "rspec/expectations"
require 'active_support'
require 'active_support/core_ext'
require 'rspec/graphql_assistant/matchers/matcher_helper'
require 'rspec/graphql_assistant/matchers/include'
require 'rspec/graphql_assistant/matchers/have_attributes'
require 'rspec/graphql_assistant/matchers/match'
require 'rspec/graphql_assistant/matchers'
require 'rspec/graphql_assistant/query_builder'
require 'rspec/graphql_assistant/argument_builder'
require 'rspec/graphql_assistant/argument_builder_with_vars'
require 'rspec/graphql_assistant/response_builder'
require 'rspec/graphql_assistant/helpers'

module Rspec
  module GraphqlAssistant
    class Error < StandardError; end
    # Your code goes here...
  end
end
