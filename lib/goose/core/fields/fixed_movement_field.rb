module Goose
  module Core
    class FixedMovementField < RegularField
      def initialize(destination)
        @destination = destination
      end

      def apply_field_rule(_, _, _)
        @destination
      end
    end
  end
end
