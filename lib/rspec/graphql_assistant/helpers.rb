module RSpec
  module GraphqlAssistant
    module Helpers

      def graphql_mutation(name, args, response)
        QueryBuilder.new(:mutation, name, args, response).call
      end

      def graphql_query(name, args, response)
        QueryBuilder.new(:query, name, args, response).call
      end

      def graphql_subscription(name, args, response)
        QueryBuilder.new(:subscription, name, args, response).call
      end
    end
  end
end