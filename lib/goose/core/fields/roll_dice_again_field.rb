module Goose
  module Core
    class RollDiceAgainField < RegularField
      def roll_again?
        true
      end
    end
  end
end
