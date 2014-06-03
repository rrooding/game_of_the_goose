module Goose
  module Core
    class SingleDice
      def roll
        Goose::Core::Roll.new Random.new.rand(6)
      end
    end
  end
end
