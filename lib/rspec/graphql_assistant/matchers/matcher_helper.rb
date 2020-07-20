module RSpec
  module GraphqlAssistant
    module Matchers
      module MatcherHelper
        def key_to_array(key, root)
          if key.is_a?(Array)
            return ([root] + key).map { |el| el.to_s.camelize(:lower) }
          end
          ([root] + [key]).map { |el| el.to_s.camelize(:lower) }
        end

        def lookup_value(actual)
          actual_copy = actual.with_indifferent_access
          keys_to_dig = key_to_array(key, root)
          actual_copy.dig(*keys_to_dig)
        end
      end
    end
  end
end

