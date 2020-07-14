module RSpec
  module GraphqlAssistant
    class ContainAttrs
      attr_reader :sample, :expected, :key

      def initialize(key, expected)
        @expected = expected
        @key = key
      end

      def matches?(actual)
        actual_copy = actual.with_indifferent_access
        value = actual_copy.dig(:data, key)
        res = true
        expected.each do |k,v|
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
