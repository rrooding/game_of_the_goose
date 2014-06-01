module Goose
  module Core
    class EmptyRoll < Goose::Core::Roll
      def initialize
        super 0
      end
    end
  end
end
