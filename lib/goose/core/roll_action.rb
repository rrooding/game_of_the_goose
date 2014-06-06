module Goose
  module Core
    class RollAction
      attr_reader :update_position

      def initialize(board, position)
        @board = board
        @update_position = position
      end

      def move(roll)
        @roll = roll
        @update_position += roll.total
        apply_board_action
      end

      def roll_again?
        @field.roll_again? @roll
      end

      private

      def apply_board_action
        @player_position = @update_position

        @field = @board.field(@player_position)
        @update_position = @field.apply_field_rule @player_position, @roll

        apply_board_action if @player_position != @update_position
      end
    end
  end
end
