module Goose
  module Core
    class GooseField < RegularField
      def apply_field_rule(position, roll)
        position + roll.total
      end
    end
  end
end
