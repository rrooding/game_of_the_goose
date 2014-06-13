module Goose
  module Core
    # turn flow, but instantiation would need to be different
    class RollAction
      def initialize(board, all_pawns)
        @board = board
        @all_pawns = all_pawns
      end

      def play(current_pawn, roll)
        @current_pawn = current_pawn
        @roll = roll

        update_pawn_blocked_state_for_current_field_and_roll

        unless @current_pawn.blocked
          update_pawn_position_for_roll_move
          update_pawn_for_board_rules
        end
      end

      def roll_again?
        @field.roll_again? @roll
      end

      private

      def update_pawn_blocked_state_for_current_field_and_roll
        if @current_pawn.blocked
          @field = @board.field(@current_pawn.position)
          @field.update_block(@current_pawn, @roll)
        end
      end

      def update_pawn_position_for_roll_move
        @current_pawn.position += @roll.total
      end

      def update_pawn_for_board_rules
        current_position = @current_pawn.position

        @field = @board.field(@current_pawn.position)
        @field.update_pawn @current_pawn, @roll, @all_pawns
        update_pawn_for_board_rules if current_position != @current_pawn.position
      end
    end
  end
end
