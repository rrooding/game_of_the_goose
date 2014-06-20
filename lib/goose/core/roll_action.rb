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
        if @current_pawn.blocked
         @field = @board.field(@next_position)
         @field.update_block(@current_pawn, @roll)
        end

        unless @current_pawn.blocked
          apply_roll_move
          apply_board_actions
        end
      end

      def new_position
        @next_position
      end

      def roll_again?
        @field.roll_again? @roll
      end

      def skip_turns
        @field.skip_turns
      end

      private

      def apply_roll_move
        @next_position += @roll.total
      end

      def apply_board_actions
        @player_position = @next_position

        @field = @board.field(@player_position)
        @next_position = @field.apply_field_rule @player_position, @roll, @all_pawns

        apply_board_actions if @player_position != @next_position
        @field.apply_block(@player_position, @current_pawn, @all_pawns)
      end
    end
  end
end
