module Goose
  module Core
    class MultiDice
      def initialize(number_of_dices)
        @number_of_dices = number_of_dices
        @dice = Goose::Core::SingleDice.new
      end

      def roll
        dice_values = Array.new(@number_of_dices) { @dice.roll.total }
        Goose::Core::Roll.new dice_values
      end
    end
  end
end
