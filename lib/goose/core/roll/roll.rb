module Goose
  module Core
    class Roll
      def initialize(dice_values)
        @dice_values = array_wrap dice_values
      end

      def total
        sum @dice_values
      end

      private

      def sum(array)
        array.reduce { |a, e| a + e }
      end

      def array_wrap(object)
        if object.nil?
          []
        elsif object.respond_to?(:to_ary)
          object.to_ary || [object]
        else
          [object]
        end
      end
    end
  end
end
