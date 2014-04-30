module Goose
  module Core
    class Game
      attr_reader :positions

      def initialize
        @positions = Array.new(63, {})
        @players = []
      end

      def add_player(name, age, color_pion)
        @players.push player(name, age)
      end

      def players_order
        @players.map(&:name)
      end

      def player_position(name)
        0
      end

      def current_player
        @current_player || youngest_player
      end

      private

      def player(name, age)
        Goose::Core::Player.new(name, age.to_i)
      end

      def youngest_player
        @players.sort_by(&:age).first
      end
    end
  end
end
