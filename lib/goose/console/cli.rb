module Goose
  module Console
    class Cli < Goose::Console::Game
      def initialize(output, input)
        @output = output
        @input = input
        super()
      end

      def run
        start_app
        execute_user_input(user_input) while finished?
      end

      def execute_user_input(msg)
        @callback.call(msg.nil? ? nil : msg.chomp)
      end

      def finished?
        @callback.nil?
      end

      protected

      def print(msg)
        @output.print(msg)
      end

      def print_line(msg)
        @output.puts(msg)
      end

      def user_input_for(callback)
        @callback = callback
      end

      def end_app
        @callback = nil
      end

      private

      def user_input
        @input.gets
      end
    end
  end
end
