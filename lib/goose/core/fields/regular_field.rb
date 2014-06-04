module Goose
  module Core
    class RegularField
      def apply_field_rule(position, _)
        position
      end

      def roll_again?(_)
        false
      end

      def skip_turns
        0
      end
    end
  end
end
