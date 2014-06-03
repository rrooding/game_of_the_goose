module Goose
  module Core


    class Game
      attr_reader :board

      def initialize(board = Board.new)
        @board = board
        @players = Players.new
        @round = Round.new @players
      end

      def add_player(name, age, color)
        @players.add_player(name, age, color)
      end

      def players
        @players.clone.freeze
      end

      def current_round
        @round.count
      end

      def current_player
        @round.current_player
      end

      def roll_dice(dice = SingleDice.new)
        play_turn(dice.roll)
      end

      def winner
        @players.select { |p| p.position >= @board.size }.first
      end

      # hand of god functions
      def move_poin(color, position)
        player = players.for_color(color)
        player.position = position
      end

      def select_current_player(player)
        @round.select_current_player player
      end

      private

      def play_turn(roll)
        player = @round.current_player
        player.position = @board.next_position player.position,
                                               roll
        end_turn unless @board.roll_again? player.position, roll
      end

      def end_turn
        @round.end_turn
      end
    end
  end
end
