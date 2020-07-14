module RSpec
  module Matchers
    def has_graphql_attrs(key, expected)
      RSpec::GraphqlAssistant::HasAttrs.new(key, expected)
    end

    def contain_graphql_attrs(key, expected)
      RSpec::GraphqlAssistant::ContainAttrs.new(key, expected)
    end
  end
end
