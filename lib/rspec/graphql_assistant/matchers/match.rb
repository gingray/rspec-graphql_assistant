module RSpec
  module GraphqlAssistant
    module Matchers
      class Match
        include MatcherHelper

        attr_reader :sample, :expected, :key, :root

        def initialize(key, expected, **args)
          @key = key
          @expected = expected
          @root = args.fetch(:root, :data)
        end

        def matches?(actual)
          value = lookup_value(actual)

          value == expected
        end

        def failure_message
          "'#{key}' not match '#{expected}'"
        end

        def description
          "'#{key}' match '#{expected}'"
        end
      end
    end
  end
end
