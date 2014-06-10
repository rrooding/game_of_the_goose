module Goose
  module Core
    # responsible for the turns
    class Round
      attr_reader :count

      def initialize(players)
        @count = 0
        @players = players
      end

      def current_player
        @current_player || starting_player
      end

      def starting_player
        @players.youngest_player
      end

      def select_next_player
        begin
          @current_player = next_player
        end  while player_skips_turn?

        update_round_status
      end

      # hand of god
      def select_current_player(player)
        @current_player = player
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

      # dirty - query and action
      def player_skips_turn?
        if current_player.skip_turn?
          current_player.turn_skipped
          return true
        end

        false
      end
    end
  end
end
