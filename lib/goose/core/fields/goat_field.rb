module Goose
  module Core
    # TODO
    class Pawn
      attr_reader :color
      attr_accessor :position

      def initialize(color, position = 0)
        @color = color
        @position = position
      end
    end

    class GoatField < RegularField
      def apply_field_rule(pos, _, all_pawns)
        jump_position(pos, all_pawns) || pos
      end

      private

      def jump_position(pos, all_pawns)
        one_step_ahead_of(the_first_pawn_ahead(pos, all_pawns))
      end

      def the_first_pawn_ahead(pos, all_pawns)
        all_pawns.sort { |p| p.position <=> pos }.select { |p| p.position > pos }.first
      end

      def one_step_ahead_of(pawn_ahead)
        pawn_ahead.position + 1 unless pawn_ahead.nil?
      end
    end
  end
end
