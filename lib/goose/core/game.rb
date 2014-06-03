module Goose
  module Core
    # responsible for the turns
    class Round
      attr_accessor :count

      def  initialize(players)
        @count = 0
        @players = players
      end

      def starting_player
        @players.youngest_player
      end

      def current_player
        @current_player || starting_player
      end

      def end_turn
        @current_player = next_player
        update_round_status
      end

      private

      def next_player
        i = @players.index(current_player)
        @players[next_index(i)]
      end

      def next_index(i)
        (i + 1) % @players.length
      end

      def update_round_status
        @count += 1 if starting_player == current_player
      end
    end

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

      def move_poin(color, position)
        player = players.for_color(color)
        player.position = position
      end

      def turn(dice = SingleDice.new)
        play_turn(dice.roll)
      end

      def play_turn(roll)
        player = @round.current_player
        player.position = @board.next_position player.position,
                                                       roll
        end_turn unless @board.roll_again? player.position, roll
      end

      def end_turn
        @round.end_turn
      end

      def winner
        @players.select { |p| p.position >= @board.size }.first
      end
    end
  end
end
