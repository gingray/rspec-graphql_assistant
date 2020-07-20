module RSpec
  module GraphqlAssistant
    module Matchers
      class Include
        include MatcherHelper
        attr_reader :sample, :expected, :key, :root

        def initialize(key, expected, **args)
          @expected = expected
          @key = key
          @root = args.fetch(:root, :data)
        end

        def matches?(actual)
          value = lookup_value(actual)

          return value.any? { |k, _v| expected.include? k } if value.is_a?(Hash)

          value.all? { |el| el.any? { |k, _v| expected.include? k } } if value.is_a?(Array)
        end

        def failure_message
          "'#{key}' not include all attributes '#{expected}'"
        end

        def description
          "'#{key}' has attributes '#{expected}'"
        end
      end
    end
  end
end
