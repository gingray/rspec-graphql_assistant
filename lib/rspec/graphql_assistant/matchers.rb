module RSpec
  module Matchers
    def graphql_include(key, expected)
      RSpec::GraphqlAssistant::Matchers::Include.new(key, expected)
    end

    def graphql_have_attributes(key, expected)
      RSpec::GraphqlAssistant::Matchers::HaveAttributes.new(key, expected)
    end

    def graphql_match(key, expected)
      RSpec::GraphqlAssistant::Matchers::Match.new(key, expected)
    end
  end
end
