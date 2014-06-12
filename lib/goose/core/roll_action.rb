module Goose
  module Core
    class RollAction
      def initialize(board, all_pawns, current_pawn, roll)
        @board = board
        @all_pawns = all_pawns
        @roll = roll
        @current_pawn = current_pawn
        @next_position = current_pawn.position
      end

      def play
        update_pawn_blocked_state_for_current_field_and_Roll

        unless @current_pawn.blocked
          apply_roll_move
          apply_board_moves
        end

        update_pawn
      end

      def roll_again?
        @field.roll_again? @roll
      end

      private

      def update_pawn_blocked_state_for_current_field_and_Roll
        if @current_pawn.blocked
          @field = @board.field(@next_position)
          @field.update_block(@current_pawn, @roll)
        end
      end

      def apply_roll_move
        @next_position += @roll.total
      end

      def apply_board_moves
        player_position = @next_position

        @field = @board.field(player_position)
        @next_position = @field.apply_field_rule player_position, @roll, @all_pawns

        apply_board_moves if player_position != @next_position
      end

      def update_pawn
        # TODO - move possible into field
        @field.apply_block(@next_position, @current_pawn, @all_pawns)
        @current_pawn.position = @next_position
        @current_pawn.skip_turns = @field.skip_turns
      end
    end
  end
end
