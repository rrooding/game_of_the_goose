module Goose
  module Core
    class Player
      attr_reader :name, :age, :color
      attr_accessor :position, :skip_turns

      def initialize(name, age, color)
        @name = name
        @age = age
        @color = color
        @position = 0
        @skip_turns = 0
      end

      def skip_turn?
        @skip_turns > 0
      end

      def turn_skipped
        @skip_turns -= 1
      end
    end
  end
end
