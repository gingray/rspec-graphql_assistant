module RSpec
  module GraphqlAssistant
    class ArgumentBuilder
      attr_reader :arguments_hash

      def initialize(arguments_hash)
        @arguments_hash = arguments_hash
      end

      def call
        process_hash(arguments_hash)
      end

      private

      def process_root(arg)
        return process_hash(arg) if arg.is_a?(Hash)
        return process_array(arg) if arg.is_a?(Array)
        process_scalar(arg) if arg.is_a?(Symbol) || arg.is_a?(String) || arg.is_a?(Numeric)
      end

      def process_scalar(arg)
        arg = "\"#{arg}\"" if arg.is_a?(Symbol) || arg.is_a?(String)
        arg
      end

      def process_array(arg)
        result = []
        arg.each do |item|
          result << process_root(item)
        end
        line = result.map { |item| "{#{item}}"}.join(', ')
      end

      def process_hash(arg)
        result = []
        arg.each do |k, v|
          arg_name = k
          arg_name = k.to_s.camelize(:lower) if k.is_a?(Symbol)
          if is_scalar?(v)
            result << "#{arg_name}: #{process_scalar(v)}"
          elsif v.is_a?(Array)
            result << "#{arg_name}: [ #{process_root(v)} ]"
          else
            result << "#{arg_name}: { #{process_root(v)} }"
          end
        end
        result.join(', ')
      end

      def is_scalar?(arg)
        arg.is_a?(Symbol) || arg.is_a?(String) || arg.is_a?(Numeric)
      end
    end
  end
end
