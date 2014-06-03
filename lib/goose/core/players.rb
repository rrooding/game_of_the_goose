module Goose
  module Core
    class Players < Array
      def for_color(color)
        select { |p| p.color == color }.first
      end

      def for_name(name)
        select { |p| p.name == name }.first
      end

      def add_player(name, age, color)
        new_player = player(name, age, color)
        push new_player
        new_player
      end

      def youngest_player
        by_age_asc.first
      end

      private

      def by_age_asc
        sort_by(&:age)
      end

      def player(name, age, color)
        Goose::Core::Player.new(name, age.to_i, color)
      end
    end
  end
end
