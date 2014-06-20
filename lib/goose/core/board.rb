module Goose
  module Core
    class Board
      def initialize(size = 63)
        @fields = Array.new(size, RegularField.new)
      end

      def size
        @fields.size
      end

      def field_type_at(position, field = GooseField.new)
        @fields[position] = field
      end

      def field(position)
        bounce = over_shoot position
        return BounceField.new bounce if bounce >= 0
        @fields[position]
      end

      private

      def over_shoot(position)
        position - size
      end
    end
  end
end
