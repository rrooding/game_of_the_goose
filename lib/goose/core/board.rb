module Goose
  module Core
    # responsible for the moves
    class Board
      FIELD_TYPES = [:goose].freeze

      def initialize(size = 63)
        @fields = Array.new(size)
      end

      def size
        @fields.size
      end

      def goose_at(position)
        @fields[position] = :goose
      end

      def next_position(start, move)
        new_position = start + move
        apply_field_rule(new_position, move)
      end

      private
      # where do object go and hide? in big or private functions
      def apply_field_rule(position, move)
        case @fields[position]
          when :goose
            position + move
          else
            position
        end
      end
    end
  end
end
