module RSpec
  module GraphqlAssistant
    class HasAttrs
      attr_reader :sample, :expected, :key

      def initialize(key, expected)
        @expected = expected
        @key = key
      end

      def matches?(actual)
        value = actual.dig('data', key)
        return value.any? { |k,_v| expected.include? k } if value.is_a?(Hash)

        value.all? { |el| el.any? { |k,_v| expected.include? k } } if value.is_a?(Array)
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
