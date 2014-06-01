module Goose
  module Core
    class Roll
      def initialize(dice_values)
        @dice_values = dice_values
      end

      def total
        @dice_values
      end
    end
  end
end
