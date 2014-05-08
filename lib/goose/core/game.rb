module Goose
  module Core
    class Game
      attr_reader :board

      def initialize(board = Board.new)
        @board = board
        @players = Players.new
      end

      def players
        @players.clone.freeze
      end

      def current_player
        @current_player || @players.youngest_player
      end

      def add_player(name, age, color)
        @players.add_player(name, age, color)
      end

      def turn(dice = Dice.new)
        moves = dice.roll

        new_player_position = current_player.position + moves
        moves *= @board.multiplier_for(new_player_position)

        current_player.position += moves

        end_turn
      end

      def winner
        @players.by_age_asc.select { |p| p.position >= @board.size }.first
      end

      def end_turn
        @current_player = next_player
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
