module Goose
  module Core
    # responsible for the moves
    class Board
      FIELD_TYPES = [:goose].freeze

      def initialize(size = 63)
        @fields = Array.new(size, RegularField.new)
      end

      def size
        @fields.size
      end

      def goose_at(position, field = GooseField.new)
        @fields[position] = field
      end

      def next_position(start, move)
        new_position = start + move
        return size if new_position > size
        @fields[new_position].apply_field_rule(new_position, move)
      end

      def roll_again?(position)
        return false if position >= size
        @fields[position].roll_again?
      end
    end
  end
end
