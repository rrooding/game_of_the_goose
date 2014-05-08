module Goose
  module Core
    class Board
      FIELD_TYPES = [:goose].freeze

      def initialize(size = 63)
        @fields = Array.new(size)
      end

      def size
        @fields.size
      end

      def goose_at(position)
        @fields[position] = :goose
      end

      def multiplier_for(position)
        case @fields[position]
        when :goose
          2
        else
          1
        end
      end
    end
  end
end
