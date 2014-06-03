module Goose
  module Core
    class RollDiceAgainField < RegularField
      def initialize
        @dice_limit = 13
      end

      def roll_again?(roll)
        true if roll.total < @dice_limit
      end

      def dice_upper_limit(roll)
        @dice_limit = roll.total
      end
    end
  end
end
