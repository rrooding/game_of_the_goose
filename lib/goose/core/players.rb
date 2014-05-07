module Goose
  module Core
    class Players < Array
      def for_color(color)
        self.select { |p| p.color == color }.first
      end

      def add_player(name, age, color)
        p = player(name, age, color)
        self.push p
        p
      end

      private

      def player(name, age, color)
        Goose::Core::Player.new(name, age.to_i, color)
      end
    end
  end
end
