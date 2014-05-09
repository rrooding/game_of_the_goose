module Goose
  module Core
    class GooseField
      def apply_field_rule(position, move)
        position + move
      end
    end
  end
end
