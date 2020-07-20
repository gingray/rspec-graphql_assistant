module RSpec
  module GraphqlAssistant
    class QueryBuilder
      attr_reader :name, :input_args, :resp_args, :type
      def initialize(type, name, input_args, resp_args)
        @type = type
        @name = name
        @input_args = input_args
        @resp_args = resp_args
      end


      def call
        template % {type: type, name: name, input_args: transform_input_args(input_args), resp_args: transform_resp_args(resp_args)}
      end

      private

      def transform_input_args(args)
        return if args.blank?
        "(#{ArgumentBuilder.new(args).call})"
      end

      def transform_resp_args(args)
        ResponseBuilder.new(args).call
      end

      def template
        <<-GQL
%{type} {
 %{name}%{input_args} {
  %{resp_args}
 }
}
        GQL
      end
    end
  end
end
