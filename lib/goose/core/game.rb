module Goose
  module Core
    class Game
      attr_reader :positions

      def initialize
        @positions = Array.new(63, {})
      end
    end
  end
end
