module Goose
  module Core
    class BounceField < RegularField
      def initialize(bounce)
        @bounce = bounce
      end

      def apply_field_rule(position, _, _)
        position - @bounce
      end
    end
  end
end
