module Goose
  module Core
    class Player
      attr_accessor :name, :age, :color, :position

      def initialize(name, age, color)
        @name = name
        @age = age
        @color = color
        @position = 0
      end
    end
  end
end
