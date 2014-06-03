require 'goose/core'

module Goose
  module Console
    class Game

      def initialize
        @game = Goose::Core::Game.new
        @poins = [:rood, :groen, :geel, :zwart, :green, :wit]
      end

      MSG_WELCOME = 'Welkom bij gansebord.'
      def start_app
        print_line(MSG_WELCOME)
        add_players_step(MSG_ADD_PlAYERS)
      end

      MSG_ADD_PlAYERS = 'Wie speelt er mee?'
      MSG_ADD_PLAYERS_ONE_NEEDED = 'Minimaal 1 speler nodig.'
      def add_players_step(msg)
        print_line(msg)
        ask_player_name
      end

      MSG_ASK_PlAYER_NAME = 'Naam: '
      def ask_player_name()
        print(MSG_ASK_PlAYER_NAME)
        user_input_for(-> (input) { player_name(input) })
      end

      def player_name(name)
        if name.nil? || name == ''
          start_game
        else
          @name = name
          ask_player_age
        end
      end

      MSG_ASK_PlAYER_AGE = 'Leeftijd: '
      def ask_player_age
        print(MSG_ASK_PlAYER_AGE)
        user_input_for(-> (input) { player_age(input) })
      end

      def player_age(age)
        age = '0' if age.nil? || age == ''
        poin_color = select_poin_step
        @game.add_player(@name, age.to_i, poin_color)
        add_more_players
      end

      MSG_POIN_SELECTED = 'Speler krijgt de pion met de kleur: '
      def select_poin_step
        poin_color = @poins[@game.players.length].to_s
        print_line(MSG_POIN_SELECTED + poin_color)
        poin_color
      end

      def add_more_players
        if @game.players.length < @poins.length
          ask_player_name
        else
          start_game
        end
      end

      def start_game
        if @game.players.length < 1
          add_players_step(MSG_ADD_PLAYERS_ONE_NEEDED)
        else
          play_round_step
        end
      end

      MSG_ROUND = 'Ronde: '
      def play_round_step
        @round = @game.round.count
        print_line(MSG_ROUND + @round.to_s)
        play_turn_step
      end

      MSG_ROLE = 'Speler %s is ge-eindigd op: %d'
      def play_turn_step
        player = @game.current_player
        @game.turn()
        print_line(sprintf(MSG_ROLE, player.name, player.position))
        next_turn
      end

      def next_turn
        if @game.winner.nil?
          @round == @game.round.count ? play_turn_step : pause_for_next_round
        else
          game_ended_step
        end
      end

      def pause_for_next_round
        user_input_for(-> (input) { play_round_step })
      end

      MSG_WINNAR = 'De winnaar is: %s'
      def game_ended_step
        print_line(sprintf(MSG_WINNAR, @game.winner.name))
        user_input_for(-> (input) { end_app })
      end
    end
  end
end
