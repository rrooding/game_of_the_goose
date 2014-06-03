module Goose
  module Core
    class RegularField
      def apply_field_rule(position, _)
        position
      end

      def roll_again?(_)
        false
      end
    end
  end
end
