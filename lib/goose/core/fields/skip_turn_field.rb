module Goose
  module Core
    class SkipTurnField < RegularField
      def initialize(turns_to_skip)
        @turns_to_skip = turns_to_skip
      end

      def skip_turns
        @turns_to_skip
      end
    end
  end
end
