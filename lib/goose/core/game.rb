module Goose
  module Core
    class Game
      attr_reader :positions

      def initialize
        @positions = Array.new(63)
        @players = Players.new
      end

      def players
        @players.clone.freeze
      end

      def players_order
        @players.map(&:name)
      end

      def player_position(player)
        player.position
      end

      def current_player
        @current_player || @players.youngest_player
      end

      def add_player(name, age, color)
        @players.add_player(name, age, color)
      end

      def turn(dice = Dice)
        moves = dice.roll
        current_player.position += moves
        end_turn
      end

      def end_turn
        @current_player = next_player
      end

      def winner
        @players.by_age_asc.select { |p| p.position >= @positions.size }.first
      end

      private

      def next_player
        i = @players.index(current_player)
        i = (i + 1) % (@players.length)
        @players[i]
      end
    end
  end
end
