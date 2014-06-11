module Goose
  module Core
    class WellField < RegularField
      def apply_block(position, pawn, all_pawns)
        reset_pawns_blocks_for(position, all_pawns)
        pawn.blocked = true
      end

      def update_block(current_pawn, roll)
        current_pawn.blocked = false if roll.total == 6
      end

      private

      def reset_pawns_blocks_for(position, all_pawns)
        all_pawns.select { |p| p.position == position }.each do |p|
          p.blocked = false
        end
      end
    end
  end
end
