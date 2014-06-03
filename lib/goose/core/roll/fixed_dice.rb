module Goose
  module Core
    class FixedDice
      def initialize(fixed_value = 0)
        @fixed_value = fixed_value
      end

      def roll
        Roll.new @fixed_value
      end
    end
  end
end
