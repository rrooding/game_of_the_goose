module Goose
  module Core
    # responsible for the moves
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

      def next_position(start, move)
        new_position = start + move
        apply_Field(new_position, move)
      end

      def roll_again?(position, dice_value)
        return false if position >= size
        @fields[position].roll_again? dice_value
      end

      private

      def apply_Field(new_position, move)
        return size if new_position >= size
        final_position = @fields[new_position].apply_field_rule(new_position, move)
        final_position = apply_Field(final_position, move) if final_position != new_position
        final_position
      end
    end
  end
end
