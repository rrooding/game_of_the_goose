module Goose
  module Core
    class Players < Array
      def for_color(color)
        select { |p| p.color == color }.first
      end

      def add_player(name, age, color)
        new_player = player(name, age, color)
        push new_player
        new_player
      end

      private

      def player(name, age, color)
        Goose::Core::Player.new(name, age.to_i, color)
      end
    end
  end
end
