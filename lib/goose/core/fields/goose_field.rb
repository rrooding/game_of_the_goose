module Goose
  module Core
    class GooseField < RegularField
      def apply_field_rule(position, move)
        position + move
      end
    end
  end
end
