module Goose
  module Core
    class RollAction
      # attr_reader :update_position

      def initialize(board, all_pawns, current_pawn, roll)
        @board = board
        @all_pawns = all_pawns
        @roll = roll
        @next_position = current_pawn.position
      end

      def play
        apply_roll_move
        apply_board_actions
      end

      def update_position
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
      end
    end
  end
end
