module Goose
  module Core
    class RollDiceAgainField < RegularField
      def initialize
        @dice_limit = 13
      end

      def roll_again?(dice_value)
        true if dice_value < @dice_limit
      end

      def dice_upper_limit(dice_value)
        @dice_limit = dice_value
      end
    end
  end
end
