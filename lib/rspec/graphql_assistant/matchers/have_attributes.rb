module RSpec
  module GraphqlAssistant
    module Matchers
      class HaveAttributes
        include MatcherHelper

        attr_reader :sample, :expected, :key, :root

        def initialize(key, expected, **args)
          @key = key
          @expected = expected
          @root = args.fetch(:root, :data)
        end

        def matches?(actual)
          value = lookup_value(actual)
          return expected_hash(value, expected) if expected.is_a?(Hash)

          false
        end

        def expected_hash(value, expected)
          res = true
          expected.each do |k, v|
            res = value[k] == v
            break unless res
          end
          res
        end

        def failure_message
          "'#{key}' not equal attributes '#{expected}'"
        end

        def description
          "'#{key}' has attributes '#{expected}'"
        end
      end
    end
  end
end
