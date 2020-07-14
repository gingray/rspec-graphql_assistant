module RSpec
  module GraphqlAssistant
    class ArgumentBuilder
      attr_reader :arguments_arr

      def initialize(arguments_arr)
        @arguments_arr = arguments_arr
      end

      def call
        result = []
        arguments_arr.each do |arg|
          result << process_root(arg)
        end
        result.join ', '
      end

      private

      def process_root(arg)
        return process_hash(arg) if arg.is_a?(Hash)
        return process_array(arg) if arg.is_a?(Array)
        process_string_or_symbol(arg) if arg.is_a?(Symbol) || arg.is_a?(String)
      end

      def process_string_or_symbol(arg)
        arg = arg.to_s.camelize(:lower) if arg.is_a?(Symbol)
        "#{arg}: $#{arg}"
      end

      def process_array(arg)
        result = []
        arg.each do |item|
          result << process_root(item)
        end
        result.join(', ')
      end

      def process_hash(arg)
        result = ''
        arg.each do |k, v|
          arg_name = k
          arg_name = k.to_s.camelize(:lower) if k.is_a?(Symbol)
          arg_value = process_root(v)
          result << "#{arg_name}: { #{arg_value} }"
        end
        result
      end
    end
  end
end
