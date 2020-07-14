module RSpec
  module GraphqlAssistant
    class QueryBuilder
      attr_reader :name, :args, :response, :type
      def initialize(type, name, args, response)
        @type = type
        @name = name
        @args = args
        @response = response
      end


      def call
        template % {type: type, name: name, args: transform_args(args), response: transform_response(response)}
      end

      private

      def transform_args(args)
        ArgumentBuilder.new(args).call
      end

      def transform_response(response)
        response.map do |item|
          next item.to_s.camelize(:lower) if item.is_a?(Symbol)
          item
        end.join("\n")
      end

      def template
        <<-GQL
%{type} {
 %{name}(%{args}) {
  %{response}
 }
}
        GQL
      end
    end
  end
end
